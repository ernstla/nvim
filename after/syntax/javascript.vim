" Vim syntax file
" Language:	Javascript
" Maintainer:	Thomas Ernst <thomas.ernst@ebenefuenf.de>
syn sync fromstart


syn keyword javascriptThis      self this angular

syn keyword javascriptReserved  from

syn match angularScope "\$\(scope\|rootScope\)\>"
syn match angularScope "scope"
syn match angularService "\$\(exceptionHandler\|filter\|http\|httpBackend\|interpolate\|locale\)"
syn match angularService "\$\(location\|log\|parse\|q\|rootElement\|router\|route\|routeParams\|templateCache\)"
syn match angularService "\$\(timeout\|window\|exceptionHandler\|httpBackend\|log\|timeout\|injector\)"
syn match angularService "\$\(provide\|cookies\|cookieStore\|httpBackend\|resource\|sanitize\)"
syn match angularService "\$\(anchorScroll\|cacheFactory\|compile\|controller\|document\|routeProvider\)"
