onintr -
if (! $?prompt) goto end

if ($?tcsh) then
    if ($tcsh != 1) then
        set rev=$tcsh:r
        set rel=$rev:e
        set pat=$tcsh:e
        set rev=$rev:r
    endif
    if ($rev > 5 && $rel > 1) then
        set complete=1
    endif
    unset rev rel pat
endif

if ($?complete) then
    complete {egcs,cxx,cc,gcc,g++} \
        'c/-[IL]/d/' \
        'n/-c/f:*.{c,c++,C,cc,cpp}/' \
        'c/-l/f:*.a/' \
        'n/*/f:*.{c,c++,C,cc,cpp,f,o}/' \
        'c/-/"(o l c g v L I D U W O2 static undef)"/'
    complete {f77,g77} \
        'c/-[IL]/d/' \
        'n/-c/f:*.f/' \
        'p/*/f:*.[fco]/'
    complete make \
        'p/1/(all clean distclean depend \
        install install.man Makefiles buildworld installworld)/'
    complete glade 'n/*/f:*.{glade,gld}/'
    complete javac 'n/*/f:*.java/'
    complete tmake \
        'n/-o/f:Makefile/' \
        'n/*/f:*.pro/'
    complete gdb			'n/-d/d/' 'n/*/c/'
    complete ar			'c/[dmpqrtx]/"(c l o u v a b i)"/' 'p/1/"(d m p q r t x)"//' \
    				'p/2/f:*.a/ p/*/f:*.o/'
    complete perl			'n/-S/c/'
    
    # Compress
    complete lha			'n/*/f:*.{lzh,LZH}/'
    complete unzip			'p/*/f:*.{ZIP,zip}/'
    complete gzip			'n/-d/f:*.{gz,Z,tgz,TGZ}/' \
    				'n/*/f:^*.{gz,Z,tgz,TGZ}/'
    complete {gunzip,gzcat,zcat}	'n/*/f:*.{gz,Z,tgz,TGZ}/'
    complete com{,press}		'n/*/f:^*.Z/'
    complete unc{,ompress}		'n/*/f:*.Z/'
    #complete tar			'n/*/f:*.{gz,Z,tar.gz,tgz,TGZ,tar.bz2}/'
    
    # Tex
    complete {*latex,'tex2*'}	'n/*/f:*.{tex,TEX,texi,ltx}/'
    complete {ghostview,'gv*'}	'c/-l/(andscape)/' \
    				'n/*/f:*.{ps,eps,pdf}/'
    complete {dvi*,x*dvi}		'n/*/f:*.{dvi,DVI}/'
    
    # Edit
    complete {gnuplot,gp}		'n/*/f:*.{plt,gp}/'
    complete 'ps\*'			'n/*/f:*.{ps,eps,PS,EPS}/'
    complete {gs,gv,ghostview}	'n/*/f:*.{ps,PS,eps,epsi,epsf,pdf,PDF}/'
    complete {acroread,xpdf}	'n/*/f:*.{pdf,PDF}/'
    complete 'tgif*'		'n/*/f:*.obj/'
    complete {vi,xvi,m,more}	'n/*/f:^*.{o,a,so,so.*}/'
    
    # Print
    complete lpr	'c/-P/$printers/' 'n/*/f:*.{ps,eps}/'
    complete lpq	'c/-P/$printers/'
    complete lprm	'c/-P/$printers/'
    complete dvips	'c/-P/$printers/' 'n/-o/f:*.{ps,PS}/' 'n/*/f:*.dvi/'
    
    # Browse
    complete {netscape,Mo,Mosaic,lynx,Lynx,w3m} \
    				'n/*/f:*.{htm,html}/'
    
    # Misc tools
    complete {x11,free}amp		'n/*/f:*.{mp3,MP3}/'
    # complete vncviewer	   'p/1/$hostnames/:'
    
    # Job
    complete ps			'n/-*u/u/'
    complete {fg,bg,stop}		'c/%/j/ p/1/"(%)"//'
    
    # Env
    complete complete		'p/1/X/'
    complete uncomplete		'n/*/X/'
    complete alias			'p/1/a/'
    complete unalias		'n/*/a/'
    complete set			'c/*=/f/' 'p/1/s/=' 'n/=/f/'
    complete unset			'n/*/s/'
    complete env			'p/1/e/='
    complete envg			'p/1/e/'
    complete {set,print}env		'p/1/e/'
    complete unsetenv		'n/*/e/'
    complete xhost			'c/*{+,-}/$hostnames/'\
    				'p/*/$hostnames/'
    complete xon			'c/*@/$hostnames/' \
    				'n/-l/u/' 'C/*/$hostnames/'
    
    # Admin
    #complete su			'c/--/"(login fast preserve-environment command shell help version)"/' \
    #				'c/-/"(f l m p c s -)"/' \
    #				'n/{-c,--command}/c/' \
    #				'n@{-s,--shell}@'`cat /etc/shells`'@' 'n/*/u/'
    
    # Daily command
    complete {cd,chdir,pushd,popd,pu,po} \
    				'p/1/d/' \
    				'n/-*/d/'
    complete rmdir			'n/*/d/'
    complete [r,s]{sh,login,l}	'c/*@/$hostnames/' \
    				'n/-l/u/' 'C/*/$hostnames/' \
    				'p/1/\$hostnames/' \
    				'c/-/"(l n)"/' \
    				'N/-l/c/' \
    				'n/-/c/' \
    				'p/2/c/' \
    				'p/*/f/'
    complete [r,s]{cp}		'c/*@/$hostnames/:' 'n/-l/u/'
    complete *ftp			'p/*/$hostnames/'
    complete {,j}{man,whatis}	'n/-M/d/' \
    				'n/*/c/'
    complete {which,where,sudo,strace,exec,trace} \
    				'p/1/c/'
    complete {finger,[M,m]ail,mailx} \
    				'c/*@/$hostnames/' 'p/1/u/@'
    complete {nslookup,host,telnet,ping,traceroute}\
    				'p/*/$hostnames/'
    complete find 'c/-/(print name type)/'
    complete find			'n/-name/f/' \
    				'n/-type/(c b d f p l s)/' \
    				'n/-exec/c/' \
    				'c/-/(name type user size ctime mtime atime print exec )/' \
    				'n/*/d/'
    complete chgrp			'p/*/g/'
    complete chown			'p/*/u/'
    # complete kill			 'c/-/`kill -l`/'
    # complete killall		 'c/-/`kill -l`/' 'p/*/c/'
    complete kill 'p/*/`ps ax | awk ?{print? ?$1?}`/'
    
    # Remove
    complete rm		'c/--/"(directory force interactive verbose recursive help version)"/' \
    #			'c/-/"(d f i v r R -)"/' \
    			'n/*/f:^*.{c,cc,C,h,in,tex}/'	# Protect precious files

    set hostnames = ( localhost \
        odin \
        goli{3,4,5,6,7,8,9} \
        duo{1,2,3,4,5,6,7,8,9,10,11} \
        moon{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20} \
        moon{21,22,23,24,25,26} \
    )

    unset noglob
    unset complete
endif

end:
    onintr
