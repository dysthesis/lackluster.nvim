;; extends

;; Control-flow interruption and short-circuiting.
([
  "return"
  "break"
  "continue"
  "?"
  "yield"
] @keyword.return
(#set! "priority" 90))

;; Async-style control-flow.
([
  "await"
] @keyword.return
(#set! "priority" 90))

;; "unreachable" in Rust is not a keyword; it is typically the macro `unreachable!()`.
((macro_invocation
  macro: (identifier) @keyword.return
  (#eq? @keyword.return "unreachable"))
(#set! "priority" 90))
