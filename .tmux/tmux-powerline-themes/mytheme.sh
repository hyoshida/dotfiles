# Default Theme

if patched_font_in_use; then
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="⮂"
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN="⮃"
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="⮀"
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="⮁"
else
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
fi

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'235'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'255'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}


# Format: segment_name background_color foreground_color [non_default_separator]

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
		"tmux_session_info 148 234" \
		#"hostname 33 0" \
		#"ifstat 30 255" \
		#"ifstat_sys 30 255" \
		#"lan_ip 24 255 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
		#"wan_ip 24 255" \
		#"vcs_branch 29 88" \
		#"vcs_compare 60 255" \
		#"vcs_staged 64 255" \
		#"vcs_modified 9 255" \
		#"vcs_others 245 0" \
	)
fi

support_grep_by_perl_regexp() {
	if [ -z "$TMUX_POWERLINE_SEG_WEATHER_GREP" ]; then
		TMUX_POWERLINE_SEG_WEATHER_GREP="${TMUX_POWERLINE_SEG_WEATHER_GREP_DEFAULT}"
	fi
	echo test | ${TMUX_POWERLINE_SEG_WEATHER_GREP} -P test > /dev/null
}

if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
	# XXX: weather で yahoo.com へのアクセス過多が発生する不具合を防止
	#      [原因] FreeBSD では textproc/gnugrep がインストールされていないと
	#             /usr/local/bin/grep が存在しないか、-P オプションが利用できないため
	#             "RSS取得 => エラー => 再試行" のループが発生する
	if support_grep_by_perl_regexp; then
		TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
			"load 237 167" \
			"battery 137 127" \
			"weather 31 255" \
			"date_day 235 136" \
			"date 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
			"time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
		)
	else
		TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
			"load 237 167" \
			"battery 137 127" \
			"date_day 235 136" \
			"date 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
			"time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
		)
	fi
fi

