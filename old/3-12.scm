(define (append x y)
    (if (null? x)
        y
        (cons (car x) (append (cdr x) y))))

(define (append! x y)
    (set-cdr! (last-pair x) y) x)

(define (last-pair x)
    (if (null? (cdr x)) x (last-pair (cdr x))))

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

(print (cdr x))

(define w (append! x y))
(print w)
(print (cdr x))

(define (make-cycle x) (set-cdr! (last-pair x) x) x)
(define z (make-cycle (list 'a 'b 'c)))
(print z)

(define (mystery x)
    (define (loop x y)
        (if (null? x)
            y
            (let ((temp (cdr x)))
                  (set-cdr! x y)
                  (loop temp x))))
    (loop x '()))

(define v (list 'a 'b 'c 'd))
(define w (mystery v))
(print w)