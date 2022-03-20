() {
  local -r zshrcd=~"/.zshrc.d"

  . "${zshrcd}/lib"

  . "${zshrcd}/colours"
  . "${zshrcd}/colourise-coreutils"

  . "${zshrcd}/completion"
  . "${zshrcd}/history"
  . "${zshrcd}/line-editing"
  . "${zshrcd}/prompt"
  . "${zshrcd}/pushd"

  __zshrc_source_base "${zshrcd}" "$(__zshrc_memoise __zshrc_platform)"
  __zshrc_source_base "${zshrcd}" "$(__zshrc_memoise __zshrc_hostname_s)"
  __zshrc_source_base "${zshrcd}" "$(__zshrc_memoise __zshrc_hostname_f)"
  __zshrc_source_base "${zshrcd}" 'aliases.d'

  __zshrc_unfunction
  unfunction __zshrc_unfunction
}

# vim:ft=zsh
