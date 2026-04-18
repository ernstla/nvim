if !exists('b:current_syntax') || b:current_syntax !=# 'caddyfile'
  finish
endif

" FrankenPHP extends the Caddyfile with additional directives and subdirectives.
syn match caddyFrankenPhpDirective "\v^\s*\zs%(frankenphp|php|php_server)\ze%(\s|$)" containedin=ALLBUT,caddyComment,caddyPlaceholder,caddyString
syn match caddyFrankenPhpSubdirective "\v^\s*\zs%(hot_reload|max_consecutive_failures|max_idle_time|max_requests|max_threads|max_wait_time|num_threads|php_ini|resolve_root_symlink|split_path|worker)\ze%(\s|$)" containedin=ALLBUT,caddyComment,caddyPlaceholder,caddyString

hi def link caddyFrankenPhpDirective caddyDirective
hi def link caddyFrankenPhpSubdirective caddySubdirective
