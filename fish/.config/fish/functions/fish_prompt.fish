function fish_prompt
        # This prompt shows:
        # - green lines if the last return command is OK, red otherwise
        # - the current path (with prompt_pwd)
        # - the current virtual environment, if any
        # - the current git status, if any, with fish_git_prompt
        # - current background jobs, if any
    
        # It goes from:
        # ┬─[~]
        # ╰─ echo here
    
        # To:
        # ┬─[dashboard]─[V:django20]─[ master↑1|●1✚1…1]
        # │ 2    15054    0%    arrêtée    sleep 100000
        # │ 1    15048    0%    arrêtée    sleep 100000
        # ╰─ echo there
    
        set -l retc red
        test $status = 0; and set retc green
    
	# --- Git Prompt Symbols ---
	set -g __fish_git_prompt_show_informative_status 1
	set -g __fish_git_prompt_showdirtystate 1
	set -g __fish_git_prompt_showuntrackedfiles 1
	set -g __fish_git_prompt_showupstream "informative"

	set -g __fish_git_prompt_char_stateseparator ' '
	set -g __fish_git_prompt_char_dirtystate '✖'
	set -g __fish_git_prompt_char_untrackedfiles '?'
	set -g __fish_git_prompt_char_stagedstate '●'
	set -g __fish_git_prompt_char_cleanstate '✔'

	# --- Git Prompt Colors ---
	set -g __fish_git_prompt_color_branch cyan
	set -g __fish_git_prompt_color_dirtystate yellow
	set -g __fish_git_prompt_color_stagedstate green
	set -g __fish_git_prompt_color_cleanstate green
	set -g __fish_git_prompt_color_untrackedfiles red
	set -g __fish_git_prompt_color_upstream blue
    
        function _prompt_wrapper
                set -l retc $argv[1]
                set -l color $argv[2]
                set -l field $argv[3]
        
                set_color $retc
                echo -n '─'
                echo -n '['
                set_color -o $color
                echo -n $field
		set_color normal
                set_color $retc
                echo -n ']'
        end
    
        set_color $retc
        echo -n '┬─'
    
	# PWD
	_prompt_wrapper $retc white "$(if test "$PWD" = "$HOME"; echo " ~"; else; echo " $(basename $PWD)"; end)"
    
        # Virtual Environment
        set -q VIRTUAL_ENV_DISABLE_PROMPT
        or set -g VIRTUAL_ENV_DISABLE_PROMPT true
        set -q VIRTUAL_ENV
	and _prompt_wrapper $retc yellow "V:(path basename "$VIRTUAL_ENV")"
    
        # git
        set -l prompt_git (fish_git_prompt '%s')
        test -n "$prompt_git"
        and _prompt_wrapper $retc $__fish_git_prompt_color_branch "󰘬 $prompt_git"

        # New line
        echo
    
        # Background jobs
        set_color normal
    
        for job in (jobs)
                set_color $retc
                echo -n '│ '
                set_color magenta
                echo $job
        end
    
	# Tail
        set_color normal
        set_color $retc
	echo -n '╰── '
	# Alternative arrow
	#echo -n '╰──❯ '
end
