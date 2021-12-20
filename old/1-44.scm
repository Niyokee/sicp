(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx)))) 3.0)

(define (n-fold-smooth f n)
  (repeated (smooth f)  n))

 (define (n-fold-smooth f dx n)
  (repeated (smooth f dx) n))
