(define (cons a b)
  (* (expt 2 a) (expt 3 b)))


(define (car c)
  (define (iter x count)
    (if (> (abs (remainder x 2)) 0)
        count
        (iter (/ x 2) (+ count 1))))
  (iter c 0))

(define (cdr c)
  (define (iter x count)
    (if (> (abs (remainder x 3)) 0)
        count
        (iter (/ x 3) (+ count 1))))
  (iter c 0))

(display (car (cons 2 3)))
(newline)
(display (cdr (cons 2 3)))
