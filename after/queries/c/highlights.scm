;; extends

([
  "break"
  "continue"
  "goto"
] @keyword.return
(#set! "priority" 200))

(return_statement "return" @keyword.return
  (#set! "priority" 200))

(break_statement "break" @keyword.return
  (#set! "priority" 200))

(continue_statement "continue" @keyword.return
  (#set! "priority" 200))

(goto_statement "goto" @keyword.return
  (#set! "priority" 200))

(return_statement) @keyword.return
  (#set! "priority" 50)

(break_statement) @keyword.return
  (#set! "priority" 50)

(continue_statement) @keyword.return
  (#set! "priority" 50)

(goto_statement) @keyword.return
  (#set! "priority" 50)

(binary_expression
  operator: ["&&" "||"] @keyword.return
  (#set! "priority" 200))

(binary_expression
  ["&&" "||"] @keyword.return
  (#set! "priority" 200))

(conditional_expression
  "?" @keyword.return
  ":" @keyword.return
  (#set! "priority" 200))

(call_expression
  function: (identifier) @keyword.return
  (#match? @keyword.return "^(__builtin_unreachable|__builtin_trap|__assume)$")
  (#set! "priority" 200))
