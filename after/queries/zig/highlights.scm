;; extends

;; Control-flow interruption and short-circuiting.
([
  "return"
  "break"
  "continue"
  "try"
  "catch"
  "orelse"
  "unreachable"
] @keyword.return
(#set! "priority" 110))

;; Coroutine-style control-flow (include only if your Zig grammar supports these).
([
  "suspend"
  "resume"
  "await"
  "nosuspend"
] @keyword.return
(#set! "priority" 110))
