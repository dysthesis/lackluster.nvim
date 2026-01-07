;; extends

("break" @keyword.return
  (#has-ancestor? @keyword.return break_statement)
  (#set! priority 300))

("continue" @keyword.return
  (#has-ancestor? @keyword.return continue_statement)
  (#set! priority 300))

("goto" @keyword.return
  (#has-ancestor? @keyword.return goto_statement)
  (#set! priority 300))

("&&" @keyword.return
  (#has-ancestor? @keyword.return binary_expression)
  (#set! priority 300))

("||" @keyword.return
  (#has-ancestor? @keyword.return binary_expression)
  (#set! priority 300))

(call_expression
  function: (identifier) @keyword.return
  (#match? @keyword.return "^(unreachable|__builtin_unreachable|__builtin_trap|__assume)$")
  (#set! priority 300))
