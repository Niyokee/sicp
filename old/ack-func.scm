; fib.scm
(use slib)
(require 'trace)

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(trace A)
(A 2 3)
