(use slib)
(require 'trace)

; aからbまで整数の和を計算する
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

; 範囲内の整数の3乗の和を計算する
(define (sum-cubes a b)
  (if (a > b)
      0
      (+ (cube a)
         (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))
         (pi-sum (+ a 4) n)))))

; これらには共通のパターンが見出せる
(define (<name> a b)
  (if (> a b)
       0
       (+ (<term> a)
          (<name> (<next> a) b))))

; 共通のパターンを実装
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
;<next>
(define (inc n) (+ n 1))
;<term>
(define (cube x)
  (* x x x))

; 例えば３乗和の総和の計算
(define (sum-cubes a b)
  (sum cube a inc b))

; termがidentity(恒等)の場合a~bの総和になる
; <term>
(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))


; pi-sum
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
   (define (pi-next x)
    (+ x 4))
    (sum pi-term a pi-next b))


; 定積分だってできちゃう
(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(trace integral)
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
