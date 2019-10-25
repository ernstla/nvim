" Angular elements in HTML files
" Language:	AngularJS
" Maintainer:	Thomas Ernst


syntax region angularVariable matchgroup=angularMarker start=/{{/ end=/}}/ containedin=@htmlAngularContainer

syntax keyword angularDirective ngAnimate ngApp ngBind ngBindHtml ngBindHtmlUnsafe ngBindTemplate ngChange ngChecked ngClass ngClassEven containedin=htmlTag
syntax keyword angularDirective ngClassOdd ngClick ngCloak ngController ngCsp ngDblclick ngDisabled ngForm ngHide ngHref containedin=htmlTag
syntax keyword angularDirective ngIf ngInclude ngInit ngList ngModel ngMousedown ngMouseenter ngMouseleave ngMousemove ngMouseover containedin=htmlTag
syntax keyword angularDirective ngMouseup ngMultiple ngNonBindable ngPluralize ngReadonly ngRepeat ngSelected ngShow ngSrc containedin=htmlTag
syntax keyword angularDirective ngStyle ngSubmit ngSwitch ngSwitchWhen ngSwitchDefault ngTransclude ngView ngOptions containedin=htmlTag
syntax match angularDirective "\<ng-\(animate\|app\|bind-html-unsafe\|bind-html\|bind-template\|bind\|change\)\>" containedin=htmlTag
syntax match angularDirective "\<ng-\(checked\|class-even\|class-odd\|class\|click\)\>" containedin=htmlTag
syntax match angularDirective "\<ng-\(cloak\|controller\|csp\|dblclick\|disabled\|form\)\>" containedin=htmlTag
syntax match angularDirective "\<ng-\(hide\|href\|if\|include\|init\|list\|model\)\>" containedin=htmlTag
syntax match angularDirective "\<ng-\(mousedown\|mouseenter\|mouseleave\|mousemove\|mouseover\)\>" containedin=htmlTag
syntax match angularDirective "\<ng-\(mouseup\|multiple\|non-bindable\|pluralize\|readonly\)\>" containedin=htmlTag
syntax match angularDirective "\<ng-\(repeat\|selected\|show\|src\|style\|submit\)\>" containedin=htmlTag
syntax match angularDirective "\<ng-\(switch-when\|switch-default\|switch\|transclude\|view\|options\)\>" containedin=htmlTag

syntax match angularUIDirective "\<ui-[^= ]*\>" containedin=htmlTag

syntax match vueDirective "\<v-\(for\|if\|show\|else\|on\|text\)\>" containedin=htmlTag
syntax match vueDirective "\<v-\(transition\|pre\|ref\|html\|class\|attr\)\>" containedin=htmlTag
syntax match vueDirective "\<v-\(sytle\|model\|repeat\|el\|cloak\)\>" containedin=htmlTag
syntax match vueDirective ":[-a-zA-Z]*" containedin=htmlTag
syntax match vueEvent "@.\{-}\>" containedin=htmlTag

" Overwrite HTML syntax
" TODO: how?

syn region angularScriptTemplate start=+<script [^>]*type *=[^>]*text/ng-template[^>]*>+
\                       end=+</script>+me=s-1 keepend
\                       contains=angularVariable,angularMarker,htmlHead,htmlTitle,htmlString,htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,htmlTag,htmlEndTag,htmlTagName,htmlSpecialChar,htmlLink,htmlBold,htmlUnderline,htmlItalic

" Hilighting
highlight link angularDirective Number
highlight link angularUIDirective Number
highlight link angularVariable Number
highlight link angularMarker Special
