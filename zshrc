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


plugins=(git rails vi-mode zsh-autosuggestions web-search)

ZSH_THEME="robbyrussell"
alias cl=clear
alias v=vim
alias vi=vim
alias mux=tmuxinator

export EDITOR='vim'
export PATH="$PATH:/usr/local/Cellar/qt55/5.5.1/bin"
export LDFLAGS="-L/usr/local/Cellar/qt55/5.5.1/lib"
export CPPFLAGS="-I/usr/local/Cellar/qt5/5.5.1/include"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
