setopt noglobalrcs

__zshrc_init() {
  local -r zshrcd=~"/.zshrc.d"

  . "${zshrcd}/vars"
  . "${zshrcd}/colours"

  . "${zshrcd}/looknfeel"
  . "${zshrcd}/aliases"

  . "${zshrcd}/filesystem"
  . "${zshrcd}/git"
  . "${zshrcd}/svn"
  . "${zshrcd}/time"
  . "${zshrcd}/tmux"

  case "$(uname -s)"; in
    "Darwin") [ -e "${zshrcd}/mac" ]   && . "${zshrcd}/mac"   ;;
    "Linux")  [ -e "${zshrcd}/linux" ] && . "${zshrcd}/linux" ;;
  esac

  for thishost in "$(hostname -s)" "$(hostname -f)"; do
    if [ -d "${zshrcd}/${thishost}" ]; then
      for hostrc in "${zshrcd}/${thishost}"/*; do
        . "$hostrc"
      done
    elif [ -f "${zshrcd}/${thishost}" ]; then
      . "${zshrcd}/${thishost}"
    fi
  done
}

__zshrc_init

# vim:ft=zsh
