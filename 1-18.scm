(use slib)
(require 'trace)

(define (f a b)
  (f-iter a b 1))

(define (f-iter a b n)
  (cond ((= b 0) n)
        ((even? b) (f-iter (double a) (halve b) n))
        (else (f-iter a (- b 1) (+ a n)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(trace f)
(trace f-iter)
(f 2 10)
