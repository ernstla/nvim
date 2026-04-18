syn match htmlHtmxAttr /\<\(data-\)\?hx-[a-zA-Z-]\+/ contained containedin=htmlTag nextgroup=htmlHtmxAttrParam
syn match htmlHtmxAttrParam /:[a-zA-Z-]\+/ contained

hi def link htmlHtmxAttr Special
hi def link htmlHtmxAttrParam Special
