(use slib)
(require 'trace)

(define (f x y)
  (if (or (= y 0) (= x y))
      1
      (+ (f (- x 1) (- y 1)) (f (- x 1) y))))

(trace f)
(f 5 3)

