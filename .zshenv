setopt noglobalrcs

() {
  local -r zshenvd=~/.zshenv.d

  . "${zshenvd}/lib"

  __zshenv_source_base "${zshenvd}" "$(__zshenv_memoise __zshenv_platform)"
  __zshenv_source_base "${zshenvd}" "$(__zshenv_memoise __zshenv_hostname_s)"
  __zshenv_source_base "${zshenvd}" "$(__zshenv_memoise __zshenv_hostname_f)"
  __zshenv_source_base "${zshenvd}" 'environment.d'

  . "${zshenvd}/path"

  __zshenv_unfunction
  unfunction __zshenv_unfunction
}

# vim:ft=zsh
