function _cmd_duration -S -d 'Show command duration'
    [ -z "$CMD_DURATION" -o "$CMD_DURATION" -lt 100 ]
    and return

    if [ "$CMD_DURATION" -lt 5000 ]
        echo -ns $timer_glyph ' ' $CMD_DURATION 'ms'
    else if [ "$CMD_DURATION" -lt 60000 ]
        echo -ns $timer_glyph ' ' _pretty_ms $CMD_DURATION s
    else if [ "$CMD_DURATION" -lt 3600000 ]
        set_color $fish_color_error
        echo -ns $timer_glyph ' ' _pretty_ms $CMD_DURATION m
    else
        set_color $fish_color_error
        _pretty_ms $CMD_DURATION h
    end

    set_color $normal
end

function _pretty_ms -S -a ms -a interval -d 'Millisecond formatting for humans'
    set -l interval_ms
    set -l scale 1

    switch $interval
        case s
            set interval_ms 1000
        case m
            set interval_ms 60000
        case h
            set interval_ms 3600000
            set scale 2
    end

    switch $FISH_VERSION
        case 2.0.\* 2.1.\* 2.2.\* 2.3.\*
            # Fish 2.3 and lower doesn't know about the -s argument to math.
            math "scale=$scale;$ms/$interval_ms" | string replace -r '\\.?0*$' $interval
        case 2.\*
            # Fish 2.x always returned a float when given the -s argument.
            math -s$scale "$ms/$interval_ms" | string replace -r '\\.?0*$' $interval
        case \*
            math -s$scale "$ms/$interval_ms"
            echo -ns $interval
    end
end

function fish_right_prompt
  set_color $color_clock
  _cmd_duration
  echo -n ' ' $clock_glyph ' '
  date "+%H:%M:%S"
  set_color normal
end
