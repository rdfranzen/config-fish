# -----------------------------------------------
# icon based on location
# -----------------------------------------------
function _path_segment -S -a segment_dir -d 'Display a shortened form of a directory'

    switch "$segment_dir"
        case /
            echo -n $lock_glyph
        case "$HOME"
            echo -n $home_glyph
        case '*'
            echo -n $folder_glyph
    end

    echo -n $parent
    echo -ns $directory ' '
end


# -----------------------------------------------
# main
# -----------------------------------------------
function fish_prompt
  set -l last_command_status $status
  set -l cwd

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  if test $last_command_status -eq 0
    set_color $color_path
    _path_segment $PWD
    set_color $fish_color_normal
  else
    set_color $fish_color_error
    _path_segment $PWD
    set_color $fish_color_normal
  end

  if git rev-parse --is-inside-work-tree > /dev/null 2>&1;
    if test "$theme_short_path" = 'yes'
      set root_folder (command git rev-parse --show-toplevel 2> /dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    end

    # path
    set_color $color_path
    echo -n -s " " $cwd
    set_color $fish_color_normal

    # git stuff
    set_color $color_git_glyph
    echo -n -s " " $git_glyph
    set_color $color_branch_glyph
    echo -n -s " " $branch_glyph
    set_color $fish_color_normal
    echo -n -s (fish_git_prompt) " "

  else
    set_color $color_path
    echo -n -s $cwd
    set_color $fish_color_normal
  end

  set_color $fish_color_cwd
  echo -n -s " " $right_arrow_glyph " "
  set_color $fish_color_normal
end
