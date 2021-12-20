(define (make-segment p1 p2) (cons p1 p2))
(define (start-s s) (car s))
(define (end-s s) (cdr s))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (print-segment s)
  (newline)
  (display "[")
  (print-point (start-s s))
  (display ",")
  (print-point (end-s s))
  (display "]"))  

(define (midpoint-segment s)
  (make-point (/ (+ (x-point (start-s s)) (x-point (end-s s))) 2.0)
              (/ (+ (y-point (start-s s)) (y-point (end-s s))) 2.0)))


(print-point (make-point 2 3))

(define p1 (make-point 2 3))
(define p2 (make-point 5 6))
(define s1 (make-segment p1 p2))
(print-segment s1)
(print-point (midpoint-segment s1))
