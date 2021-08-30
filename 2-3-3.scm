(define (element-of-set-slow? x set)
    (cond ((null? set) #f)
          ((equal? x (car set)) #t)
          (else (element-of-set-slow? x (cdr set)))))

; 追加すべきオブジェクトが既にその集合の中にあればその集合を返す
; そうでなければconsを使う
(define (adjoin-set x set)
    (if (element-of-set? x set)
        set
        (cons x set)))

(define (intersection-set-slow set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
          ((element-of-set? (car set1) set2)
              (cons (car set1)
                    (intersection-set-slow (cdr set1) set2)))
          (else (intersection-set-slow (cdr set1) set2))))

; 改良版element-of-set
(define (element-of-set? x set)
    (cond ((null? set) #f)
          ((= x (car set)) #t)
          ((< x (car set)) #f)
          (else (element-of-set? x (cdr set)))))
(use slib)
(require 'trace)


; 改良版intersection-set
(define (intersection-set set1 set2)
    (if (or (null? set1) (null? set2))
        '()
        (let ((x1 (car set1)) (x2 (car set2)))
            (cond ((= x1 x2) (cons x1 (intersection-set (cdr set1) (cdr set2))))
                  ((< x1 x2) (intersection-set (cdr set1) set2))
                  ((< x2 x1) (intersection-set set1 (cdr set2)))))))
