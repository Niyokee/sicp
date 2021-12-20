(use slib)
(require 'trace)

(define (count-pairs x)
    (if (not (pair? x))
        0
        (+ (count-pairs (cdr x))
           1)))

(define x (list (list 'a 'b) 'b))
(define x1 (list 'a '()))
(define x2 (list 'a 'b))
(define y (list 'b 'c))
(define z (list 'd 'e))
; 要素3
(define z1 (list '() '() '()))
;要素4
; (define z1 (list '() '() x1))
; 要素7
(define z1 (list '() (list '() 'b) (list '() 'b)))
(trace count-pairs)
(print (count-pairs z1))