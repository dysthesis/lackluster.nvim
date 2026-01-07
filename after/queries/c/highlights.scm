;; extends

([
  "break"
  "continue"
  "goto"
] @keyword.return
(#set! priority 300))

(["&&" "||"] @keyword.return
 (#set! priority 300))

(conditional_expression
  ["?" ":"] @keyword.return
  (#set! priority 300))

(call_expression
  function: (identifier) @keyword.return
  (#match? @keyword.return "^(__builtin_unreachable|__builtin_trap|__assume)$")
  (#set! priority 300))
