__zprofile_init() {
  local -r zshrcd=~"/.zshrc.d"
  local -r zprofiled=~"/.zprofile.d"
  local host hostrc

  . "${zshrcd}/vars"

  . "${zprofiled}/environment"

  case "$(uname -s)"; in
    "Darwin") [ -e "${zprofiled}/mac" ]   && . "${zprofiled}/mac"   ;;
    "Linux")  [ -e "${zprofiled}/linux" ] && . "${zprofiled}/linux" ;;
  esac

  for host in "$(hostname -s 2>/dev/null)" "$(hostname -f 2>/dev/null)"; do
    if [ -d "${zprofiled}/${host}" ]; then
      for hostrc in "${zprofiled}/${host}"/*; do
        . "$hostrc"
      done
    elif [ -f "${zprofiled}/${host}" ]; then
      . "${zprofiled}/${host}"
    fi
  done
}

__zprofile_init

# vim:ft=zsh
