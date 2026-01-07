;; extends

;; Control-flow interruption.
([
  "return"
  "break"
  "continue"
  "goto"
] @keyword.return
(#set! "priority" 200))

;; Short-circuit operators.
(binary_expression
  operator: ["&&" "||"] @keyword.return
  (#set! "priority" 200))

;; Ternary conditional operator tokens.
(conditional_expression
  "?" @keyword.return
  ":" @keyword.return
  (#set! "priority" 200))

;; Common "unreachable" spellings in real-world C codebases.
((call_expression
  function: (identifier) @keyword.return
  (#match? @keyword.return "^(__builtin_unreachable|unreachable|__assume)$"))
(#set! "priority" 200))
