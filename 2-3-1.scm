(define a 1)
(define b 2)
(print (list a b))
(print (list 'a 'b))
(print (list 'a b))

(print (car '(a b c)))
(print (cdr '(a b c)))

(define (memq item x)
    (cond ((null? x) #f)
          ((eq? item (car x)) x)
          (else (memq item (cdr x)))))

