(define (f b n)
  (f-iter 1 b n))

(define (f-iter a b n)
  (cond ((= n 0) a)
        ; n = countがevenの場合は底を2乗して指数を半分にする
        ; 2^4 = 4^2 = (b^n/2)^2 = (b^2)^n/2 
        ((even? n) (f-iter a (* b b) (/ n 2)))
        ; n = countがoddの場合は普通に指数計算
        (else (f-iter (* a b) b (- n 1)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x ))
