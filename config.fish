# -----------------------------------------------
# load aliases
if test -e $HOME/.config/fish/alias.fish
  source $HOME/.config/fish/alias.fish
end

# -----------------------------------------------
# load color profiles
if test -e $HOME/.config/fish/color_profiles.fish
  source $HOME/.config/fish/color_profiles.fish
end



# -----------------------------------------------
# layout tweaks

# glyphs and chars ------------------------------
set -x folder_glyph       ""
set -x home_glyph         ""
set -x lock_glyph         ""
set -x clock_glyph        "⏲"
set -x timer_glyph        ""
set -x right_arrow_glyph  "❱"

set -x git_glyph ""
set -x branch_glyph ""

set -g __fish_git_prompt_char_cleanstate      "✔"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_dirtystate      "✚ "
set -g __fish_git_prompt_char_invalidstate    "✖"
set -g __fish_git_prompt_char_stagedstate     "●"
set -g __fish_git_prompt_char_untrackedfiles  " ᎒"
set -g __fish_git_prompt_char_upstream_ahead  "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""


# -----------------------------------------------
# color profile
# function defined in function/color_profiles.fish
fish_prompt_mixed1

# -----------------------------------------------
# other colors
set -g color_clock 395573
set -g color_path 477ab3
set -g color_git_glyph $fish_color_host_remote
set -g color_branch_glyph $fish_color_host_remote

set -g __fish_git_prompt_color_branch         8c4665 '--bold'
set -g __fish_git_prompt_color_cleanstate     'green' '--bold'
set -g __fish_git_prompt_color_dirtystate     'blue'
set -g __fish_git_prompt_color_invalidstate   'red'
set -g __fish_git_prompt_color_stagedstate    'yellow'
set -g __fish_git_prompt_color_untrackedfiles 'brown'

set -g color_cwd        (set_color $fish_color_cwd)
set -g color_directory  (set_color cyan)
set -g color_normal     (set_color $fish_color_normal)
set -g color_repository (set_color $fish_color_cwd)


# -----------------------------------------------
# misc
set -g fish_prompt_pwd_dir_length 0


# git prompt ------------------------------------
set -g __fish_git_prompt_char_stateseparator      " "
set -g __fish_git_prompt_show_informative_status  1
set -g __fish_git_prompt_showcolorhints           1
set -g __fish_git_prompt_showuntrackedfiles       1
set -g __fish_git_prompt_showupstream             auto
set -g __fish_git_prompt_showupstream             "informative"
