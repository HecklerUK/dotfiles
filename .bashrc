# prompt
PS1='[\D{%Y/%m/%d} \t \H] \$ '

# alias
alias l='ls -tF --color=auto'
alias ls='ls -tF --color=auto'
alias ll='ls -altF --color=auto'
alias la='ls -atF --color=auto'
alias lla='ls -altF --color=auto'
alias lld='ls -altFd --color=auto'
alias sc='screen -R -DD'
alias pip2='pip2 -vv'
alias pip3='pip3 -vv'
alias vim='nvim'

# for root
if test "$UID" == 0; then
	alias mv='mv -i'
	alias cp='cp -i'
	alias rm=':'
fi

# share history
function share_history
{
	history -a
	history -c
	history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
shopt -s cmdhist

# test
if test -t 0; then
	stty stop undef
  # or ^H
	stty erase "^?"
fi

if test -f /usr/share/bash-completion/bash_completion; then
	. /usr/share/bash-completion/bash_completion
fi

export LD_LIBRARY_PATH=PATH:"/usr/local/lib:/usr/lib"
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:${GOPATH//://bin:}/bin
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export SCREENDIR=$HOME/.screen

if type trash-put &> /dev/null
then
  alias rm=trash-put
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

