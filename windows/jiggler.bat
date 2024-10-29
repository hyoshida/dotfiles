@powershell -NoProfile -ExecutionPolicy Unrestricted "&([ScriptBlock]::Create((cat -encoding utf8 \"%~f0\" | ? {$_.ReadCount -gt 2}) -join \"`n\"))" %*
@exit /b

Param($minutes = 600)

$myWindowsID = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal = new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator
if (!$myWindowsPrincipal.IsInRole($adminRole)) {
  $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell"
  $newProcess.Arguments = $myInvocation.MyCommand.Definition
  $newProcess.Verb = "runas"
  [System.Diagnostics.Process]::Start($newProcess)
}

$cs = @"
using System;
using System.Runtime.InteropServices;

public class Win32SendInput {
  [DllImport("user32.dll")]
  static extern uint SendInput(uint nInputs, ref INPUT pInputs, int cbSize);

  [StructLayout(LayoutKind.Sequential)]
  struct INPUT {
    public int type;
    public MOUSEINPUT mi;
  }

  [StructLayout(LayoutKind.Sequential)]
  struct MOUSEINPUT {
    public int dx;
    public int dy;
    public uint mouseData;
    public uint dwFlags;
    public uint time;
    public IntPtr dwExtraInfo;
  }

  public static void PreventScreenSaver() {
    INPUT input = new INPUT();
    input.type = 0; // INPUT_MOUSE;
    input.mi = new MOUSEINPUT();

    input.mi.dwExtraInfo = IntPtr.Zero;
    input.mi.dx = 0;
    input.mi.dy = 0;
    input.mi.time = 0;
    input.mi.mouseData = 0;
    input.mi.dwFlags = 0x0001; // MOVE (RELATIVE)
    var cbSize = Marshal.SizeOf(typeof(INPUT));
    var r = SendInput(1, ref input, cbSize);
  }
}
"@
Add-Type -Language CSharp -TypeDefinition $cs

for ($i = 0; $i -lt $minutes; $i++) {
  Write-Host $i
  Start-Sleep -Seconds 60
  [Win32SendInput]::PreventScreenSaver()
}
