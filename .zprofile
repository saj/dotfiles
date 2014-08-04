__zprofile_init() {
  local -r zshrcd=~"/.zshrc.d"
  local -r zprofiled=~"/.zprofile.d"

  . "${zprofiled}/lib"

  . "${zprofiled}/environment"

  case "$(uname -s)"; in
    "Darwin") [[ -e "${zprofiled}/mac" ]]   && . "${zprofiled}/mac"   ;;
    "Linux")  [[ -e "${zprofiled}/linux" ]] && . "${zprofiled}/linux" ;;
  esac

  local host hostrc
  for host in "$(hostname -s 2>/dev/null)" "$(hostname -f 2>/dev/null)"; do
    if [[ -d "${zprofiled}/${host}" ]]; then
      for hostrc in "${zprofiled}/${host}"/*; do
        . "${hostrc}"
      done
    elif [[ -f "${zprofiled}/${host}" ]]; then
      . "${zprofiled}/${host}"
    fi
  done

  __zprofile_lib_unfunction
  unfunction __zprofile_lib_unfunction
}

__zprofile_init
unfunction __zprofile_init

# vim:ft=zsh
