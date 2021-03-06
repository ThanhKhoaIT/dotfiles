# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

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

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
export ZSH_CUSTOM="~/.oh-my-zsh"

source ~/.oh-my-zsh/oh-my-zsh.sh
plugins=(git rails vi-mode )
# ZSH_THEME="robbyrussell"
alias cl=clear
alias v=vim
alias vi=vim
alias mux=tmuxinator

export EDITOR='vim'
export LDFLAGS="-L/usr/local/opt/qt5/lib"
export CPPFLAGS="-I/usr/local/opt/qt5/include"
export PKG_CONFIG_PATH="/usr/local/opt/qt5/lib/pkgconfig"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
