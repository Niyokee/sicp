(use slib)
(require 'trace)

(define (simpson f a b n)
  (define (y a b n k)
    (f (+ a (* k (h a b n)))))
  (define (simpson-term k)
    (* (cond ((or (= k 0) (= k n)) 1.0)
             ((even? k) 2.0)
             (else 4.0))
       (y a b n k)))
  (* (/ (h a b n) 3) (sum simpson-term 0 inc n)))

(define (inc x) (+ x 1))
(define (h a b n) (/ (- b a) n))

(define (cube x) (* x x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(trace simpson)
(simpson cube 0 1 10000)

