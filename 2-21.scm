(define (square-list items)
  (if (null? items)
      '()
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

(print (square-list (list 1 2 3 4 5)))

(define (map proc items)
 (if (null? items)
     '()
     (cons (proc (car items))
            (map proc (cdr items)))))

(define (square x) (* x x))

(define (square-list items)
  (map (lambda (x) (square x)) items))

(print (square-list (list 1 2 3 4 5)))
