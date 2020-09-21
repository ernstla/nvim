" ALE fixing and linting.
if exists('g:loaded_ale')
  if !exists('b:ale_fixers')
    let b:ale_fixers = ['eslint', 'prettier']
  endif

  if !exists('b:ale_linter_aliases')
    let b:ale_linter_aliases = ['css', 'javascript']
  endif

  if !exists('b:ale_linters')
    let b:ale_linters = ['stylelint', 'eslint', 'prettier']
  endif
endif
