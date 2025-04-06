# load custom executable functions
# for function in ~/.zsh/functions/*; do
#   source $function
# done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
ZSH_TMUX_AUTOSTART=true

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
export ZSH_CUSTOM="~/.oh-my-zsh"

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export ZSH="/Users/khoa/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

plugins=(git rails vi-mode)
ZSH_THEME="robbyrussell"
# ZSH_THEME="awesomepanda"
alias cl=clear
alias v=nvim
alias vi=nvim
alias mux=tmuxinator

export EDITOR='nvim'
export LDFLAGS="-L/usr/local/opt/qt5/lib"
export CPPFLAGS="-I/usr/local/opt/qt5/include"
export PKG_CONFIG_PATH="/usr/local/opt/qt5/lib/pkgconfig"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.bin:$PATH"

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="$PATH:/Volumes/K/flutter/bin"
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/khoa/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/khoa/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/khoa/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/khoa/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
PATH=$(pyenv root)/shims:$PATH
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
export DISABLE_DATABASE_ENVIRONMENT_CHECK=1

test -e /Users/khoa/.iterm2_shell_integration.zsh && source /Users/khoa/.iterm2_shell_integration.zsh || true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/khoa/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/khoa/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/khoa/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/khoa/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

test -e ~/.zshrc.local && source ~/.zshrc.local || true
