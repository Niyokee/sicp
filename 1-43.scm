(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (repeated f n)
  (if (= n 0)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))))

(display ((repeated square 2) 5))
