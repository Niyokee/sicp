(use slib)
(require 'trace)

(define (f a b)
  (cond ((= b 0) 0)
        ((even? b) (double (f a (halve b))))
        (else (+ a (f a (- b 1))))))


(define (even? n)
  (= (remainder n 2) 0))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(trace f)
(f 2 10)
