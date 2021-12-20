(use slib)
(require 'trace)

(define (deep-reverse items)
  (if (not (pair? items))
      items
      (reverse (map deep-reverse items))))

(define x (list (list 1 2) (list 3 4)))

(trace deep-reverse)
(deep-reverse x)
