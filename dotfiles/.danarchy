alias python='python3'
alias encrypt='gpg -c --cipher-algo AES256'
alias rtw='tmux rename-window'
alias ll='ls -lsh'
alias where='curl -s https://ifconfig.co/json | python -m json.tool'

export PS1='$(if [[ -n "${TMUX}" ]]; then rtw "${PWD}"; fi;)\u@\h:\W$ '