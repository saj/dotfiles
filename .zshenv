__zshenv_init() {
  local -r zshrcd=~"/.zshrc.d"
  local -r zshenvd=~"/.zshenv.d"

  . "${zshenvd}/lib"

  case "$(uname -s)"; in
    "Darwin") [[ -e "${zshenvd}/mac" ]]   && . "${zshenvd}/mac"   ;;
    "Linux")  [[ -e "${zshenvd}/linux" ]] && . "${zshenvd}/linux" ;;
  esac

  local host hostrc
  for host in "$(hostname -s 2>/dev/null)" "$(hostname -f 2>/dev/null)"; do
    if [[ -d "${zshenvd}/${host}" ]]; then
      for hostrc in "${zshenvd}/${host}"/*; do
        . "${hostrc}"
      done
    elif [[ -f "${zshenvd}/${host}" ]]; then
      . "${zshenvd}/${host}"
    fi
  done

  local envrc
  for envrc in "${zshenvd}/environment.d"/*; do
    . "${envrc}"
  done

  . "${zshenvd}/path"

  __zshenv_lib_unfunction
  unfunction __zshenv_lib_unfunction
}

__zshenv_init
unfunction __zshenv_init

# vim:ft=zsh
