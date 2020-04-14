" Nim syntax file
" Language:	Nim
" Maintainer:	Thomas Ernst <thomas.ernst@ebenefuenf.de>

syn keyword nimSelf self this
syn region nimPragma  start=+{.+ end=+.}+ keepend
syn keyword nimAsync spawn async waitFor runForever await asyncCheck poll
syn keyword nimBle task cpFile mkDir rmDir rmFile exec
