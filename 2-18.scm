(use slib)
(require 'trace)

(define (reverse items)
  (iter items nil))

(define (iter lis result)
  (if (null? lis)
      result
      (iter (cdr lis) (cons (car lis) result))))

(trace reverse)
(trace iter)
(reverse (list 1 3 9 16 25))