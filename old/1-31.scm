(use slib)
(require 'trace)

(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-rec term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
     result
     (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (idenitity x) x)
(define (inc x) (+ 1 x))

(define (factorial n)
  (product-iter identity 1 inc n))

(trace factorial)
(trace product-rec)
(trace product-iter)

(factorial 3)


