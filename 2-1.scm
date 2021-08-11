
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (make-rat n d)
  (if (> (* n d) 0)
      (cons n d)
      (cond ((and (> n 0) (< d 0)) (cons (* -1 n) d))
            ((and (< n 0) (> d 0)) (cons (n (* -1 d)))))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define one-half (make-rat -1 2))
(print-rat one-half)
(define one-third (make-rat 1 -3))
(print-rat one-third)
