(define (segments->painter segment-list)
    (lambda (frame)
        (for-each
            (lambda (segment)
                (draw-line
                    ((frame-coord-map frame) (start-segment segment))
                    ((frame-coord-map frame) (end-segment segment))))
    segment-list)))

(define (make-segment v1 v2) (cons v1 v2))
(define (start-segment v) (car v))
(define (end-segment v) (cdr v))

(define (make-vect x y) (cons x y))

(print (make-segment (make-vect 1 2) (make-vect 4 5)))
(print (start-segment (make-segment (make-vect 1 2) (make-vect 4 5))))
(print (end-segment (make-segment (make-vect 1 2) (make-vect 4 5))))