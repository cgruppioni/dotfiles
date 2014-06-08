# Initialize fasd (https://github.com/clvv/fasd)
eval "$(fasd --init auto)"

function cd {
  echo "Use j, or v for vim!"
}

# jump to recently used items
alias j='fasd_cd -d' # cd, same functionality as j in autojump
alias v='f -e vim' # quick opening files with vim
