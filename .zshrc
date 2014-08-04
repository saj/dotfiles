setopt noglobalrcs

__zshrc_init() {
  local -r zshrcd=~"/.zshrc.d"
  local host hostrc

  . "${zshrcd}/vars"
  . "${zshrcd}/colours"
  . "${zshrcd}/colourise-coreutils"

  . "${zshrcd}/filesystem"
  . "${zshrcd}/git"
  . "${zshrcd}/time"
  . "${zshrcd}/tmux"

  . "${zshrcd}/completion"
  . "${zshrcd}/history"
  . "${zshrcd}/line-editing"
  . "${zshrcd}/prompt"
  . "${zshrcd}/pushd"
  . "${zshrcd}/aliases"

  case "$(uname -s)"; in
    "Darwin") [ -e "${zshrcd}/mac" ]   && . "${zshrcd}/mac"   ;;
    "Linux")  [ -e "${zshrcd}/linux" ] && . "${zshrcd}/linux" ;;
  esac

  for host in "$(hostname -s 2>/dev/null)" "$(hostname -f 2>/dev/null)"; do
    if [ -d "${zshrcd}/${host}" ]; then
      for hostrc in "${zshrcd}/${host}"/*; do
        . "$hostrc"
      done
    elif [ -f "${zshrcd}/${host}" ]; then
      . "${zshrcd}/${host}"
    fi
  done
}

__zshrc_init

# vim:ft=zsh
