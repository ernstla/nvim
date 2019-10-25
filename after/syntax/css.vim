" Vim syntax file
" Language:	CSS
" Maintainer:	Thomas Ernst <thomas.ernst@ebenefuenf.de>

syn region cssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=cssAttrRegion,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssTagName,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssHacks keepend fold
