(use slib)
(require 'trace)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (inc n) (+ n 1))

(define (cube x)
  (* x x x))

(trace sum)

(sum cube 1 inc 10)

