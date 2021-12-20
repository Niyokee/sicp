(load "./2-3-3.scm")
(use slib)
(require 'trace)

(define (adjoin-set x set)
    (cond ((null? set) (list x))
          ; xがsetに含まれる場合
          ((= x (car set)) set)
          ; xがsetの先頭に来る場合
          ((< x (car set)) (cons x set))
          (else (cons (car set) (adjoin-set x (cdr set))))))

(trace adjoin-set)
(print (adjoin-set 4 '(1 2 3 5)))