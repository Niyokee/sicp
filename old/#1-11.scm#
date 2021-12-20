(use slib)
(require 'trace)

(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
         (* 2 (f-rec (- n 2)))
         (* 3 (f-rec (- n 3))))))

(trace f-rec)
;(f-rec 3)

(define (f n)
 (f-iter 2 1 0 n))
(define (f-iter a b c n)
 (cond ((= n 0) c)
       ((= n 1) b)
       ((= n 2) a)
       (else (f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1)))))

(trace f)
(trace f-iter)
(f 5)
