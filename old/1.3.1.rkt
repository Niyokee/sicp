#lang sicp

; sum up from a to b
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))


; sum-cubes
(define (sum-cubes a b)
  (define (cube x)
    (* x x x))
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

;共通の処理を見出す
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (new-sum-cubes a b)
  (define (cube x )
    (* x x x ))
  (sum cube a inc b))

;sum-integeresをreplace
(define (new-sum-integers a b)
  (define (identity x) x)
  (sum identity a inc b))

(new-sum-integers 1 5)





