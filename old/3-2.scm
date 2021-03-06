(define (make-mentioned f)
    (define (increment count)
        (+ count 1))
    (define (reset count)
        (set! count (- count count)))
    (cond (eq? f '))
)

(define (make-monitored f)
    (let ((counter 0))
        (define (mf m)
            (cond ((eq? m 'how-many-calls?)
                counter)
                ((eq? m 'reset-count)
                (begin (set! counter 0) counter))
                (else
                (begin (set! counter (+ counter 1)) (f m)))))
    mf))
(s 100)
(s 'how-many-calls?)