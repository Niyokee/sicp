(use slib)
(require 'trace)

(define (reverse-square-list items)
   (iter items '()))

(define (iter things answer)
  (if (null? things)
      answer
      (iter (cdr things) (cons (square (car things)) answer))))

(trace reverse-square-list)
(trace iter)
(print (reverse-square-list (list 1 2 3 4 5)))


(define (debug-square-list items)
   (d-iter items '()))

(define (d-iter things answer)
      (if (null? things)
      answer
      (d-iter (cdr things) (cons answer (square (car things))))))

(trace debug-square-list)
(trace d-iter)
(print (debug-square-list (list 1 2 3 4 5)))


(define (square-list items)
   (n-iter items ()))

(define (n-iter things answer)
      (if (null? things)
      answer
      (n-iter (cdr things) (append answer (list (square (car things)))))))

(trace square-list)
(trace n-iter)
(print (square-list (list 1 2 3 4 5)))
