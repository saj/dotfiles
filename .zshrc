__zshrc_init() {
  local -r zshrcd=~"/.zshrc.d"

  . "${zshrcd}/colours"
  . "${zshrcd}/colourise-coreutils"

  . "${zshrcd}/completion"
  . "${zshrcd}/history"
  . "${zshrcd}/line-editing"
  . "${zshrcd}/prompt"
  . "${zshrcd}/pushd"

  case "$(uname -s)"; in
    "Darwin") [[ -e "${zshrcd}/mac" ]]   && . "${zshrcd}/mac"   ;;
    "Linux")  [[ -e "${zshrcd}/linux" ]] && . "${zshrcd}/linux" ;;
  esac

  local host hostrc
  for host in "$(hostname -s 2>/dev/null)" "$(hostname -f 2>/dev/null)"; do
    if [[ -d "${zshrcd}/${host}" ]]; then
      for hostrc in "${zshrcd}/${host}"/*; do
        . "${hostrc}"
      done
    elif [[ -f "${zshrcd}/${host}" ]]; then
      . "${zshrcd}/${host}"
    fi
  done

  local aliasesrc
  for aliasesrc in "${zshrcd}/aliases.d"/*; do
    . "${aliasesrc}"
  done
}

__zshrc_init
unfunction __zshrc_init

# vim:ft=zsh
