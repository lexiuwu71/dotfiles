#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias neofetch="fastfetch"
alias hyfetch="hyfetch --ascii-file ~/.config/fastfetch/ascii/arch.txt"
alias uwu="uwufetch"
alias apps="~/.tui_apps.sh"

fastfetch

#\033[1m - bold
#\033[0m - reset

#| Color Name | Foreground Color Code | Background Color Code |
#| :--------- | :-------------------- | :-------------------- |
#| Black      | `30`                  | `40`                  |
#| Red        | `31`                  | `41`                  |
#| Green      | `32`                  | `42`                  |
#| Yellow     | `33`                  | `43`                  |
#| Blue       | `34`                  | `44`                  |
#| Magenta    | `35`                  | `45`                  |
#| Cyan       | `36`                  | `46`                  |
#| White      | `37`                  | `47`                  |
#| Default    | `39`                  | `49`                  |


#| Color Name     | Foreground Color Code | Background Color Code |
#| :------------- | :-------------------- | :-------------------- |
#| Bright Black   | `90`                  | `100`                 |
#| Bright Red     | `91`                  | `101`                 |
#| Bright Green   | `92`                  | `102`                 |
#| Bright Yellow  | `93`                  | `103`                 |
#| Bright Blue    | `94`                  | `104`                 |
#| Bright Magenta | `95`                  | `105`                 |
#| Bright Cyan    | `96`                  | `106`                 |
#| Bright White   | `97`                  | `107`                 |

#PS1="\033[1m\033[95m\u\033[34m@\033[95m\h\033[37m\W\> \033[0m"
# chatgpt said this will fix line wrapping and it does i hate ai sm
PS1='\[\033[1m\033[95m\]\u\[\033[34m\]@\[\033[95m\]\h \[\033[37m\]\W\[> \033[0m\]'
