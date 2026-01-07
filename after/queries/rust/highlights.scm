;; extends

;; Control-flow interruption and short-circuiting.
([
  "return"
  "break"
  "continue"
  "?"
  "yield"
] @keyword.return
(#set! "priority" 110))

;; Async-style control-flow.
([
  "await"
] @keyword.return
(#set! "priority" 110))

;; "unreachable" in Rust is not a keyword; it is typically the macro `unreachable!()`.
((macro_invocation
  macro: (identifier) @keyword.return
  (#eq? @keyword.return "unreachable"))
(#set! "priority" 110))
