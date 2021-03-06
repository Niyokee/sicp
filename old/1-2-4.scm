(use slib)
(require 'trace)


; ステップ数θ(n) 空間θ(n)
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))


(define (f b n)
  (f-iter 1 b n))

(define (f-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (f-iter a (* b b) (/ n 2)))
        (else (f-iter (* a b) b (- n 1)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x ))

(trace expt)
(trace f)
(trace f-iter)
(f 2 5)
;(expt 2 10)
