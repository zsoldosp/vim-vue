if exists('b:current_syntax')
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

silent! syntax include @pug syntax/pug.vim
unlet! b:current_syntax

silent! syntax include @css syntax/css.vim
unlet! b:current_syntax

silent! syntax include @scss syntax/scss.vim
unlet! b:current_syntax

silent! syntax include @javascript syntax/javascript.vim
unlet! b:current_syntax

syntax keyword htmlTagName contained template
syntax keyword htmlArg contained lang scoped
syntax keyword htmlArg contained ref slot
syntax match   htmlTagName "[-0-9a-z]" contained
syntax match   htmlArg "[@v:]\?[-:.0-9_a-z]" contained

syntax region  vueTagName contained start=/<\/\?\(template\|script\|style\)/ end=/>/ contains=htmlTagN,htmlTagName,htmlArg,htmlString fold

syntax region  template keepend start=/<template \+lang="pug">/ end=/<\/template>/ contains=@pug,vueTagName fold
syntax region  style keepend start=/<style \+lang="scss"[^>]*>/ end=/<\/style>/ contains=@scss,vueTagName fold
syntax region  style keepend start=/<style\( \+scoped\)\?>/ end=/<\/style>/ contains=@css,vueTagName fold
syntax region  script keepend start=/<script>/ end=/<\/script>/ contains=@javascript,vueTagName fold

let b:current_syntax = 'vue'
