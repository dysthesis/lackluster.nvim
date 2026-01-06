;; extends

([ "return" "yield" "?" ] @keyword.return (#set! priority 110))
([ "break" "continue" ] @keyword.exception (#set! priority 110))
