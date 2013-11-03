__zprofile_init() {
  local -r zshrcd=~"/.zshrc.d"
  local -r zprofiled=~"/.zprofile.d"

  . "${zshrcd}/vars"

  . "${zprofiled}/environment"

  case "$(uname -s)"; in
    "Darwin") [ -e "${zprofiled}/mac" ]   && . "${zprofiled}/mac"   ;;
    "Linux")  [ -e "${zprofiled}/linux" ] && . "${zprofiled}/linux" ;;
  esac

  for thishost in "$(hostname -s)" "$(hostname -f)"; do
    if [ -d "${zprofiled}/${thishost}" ]; then
      for hostrc in "${zprofiled}/${thishost}"/*; do
        . "$hostrc"
      done
    elif [ -f "${zprofiled}/${thishost}" ]; then
      . "${zprofiled}/${thishost}"
    fi
  done
}

__zprofile_init

# vim:ft=zsh
