(load "./2-3-3.scm")
(use slib)
(require 'trace)

; (define (union-set set1 set2)
;     (cond ((null? set1) set2)
;           ((null? set2) set1)
;           ((element-of-set?
;                (car set1) set2)
;                (union-set (cdr set1) set2))
;           (else (cons (car set1) (union-set (cdr set1) set2)))))


(define (union-set set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          (else
              (let ((x1 (car set1)) (x2 (car set2)))
                  (cond ((= x1 x2) (cons (car set1) (union-set (cdr set1) (cdr set2))))
                        ((< x1 x2) (union-set (cdr set1) set2))
                        ((< x2 x1) (union-set set1 (cdr set2))))))))



; (trace union-set)
(print (union-set '(1 2 3 4 5) '(2 4 6)))
(print (union-set '(1 2) '(2 4 6)))
(print (union-set '(1 2) '(1 2 4 6 8 10)))