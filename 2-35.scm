(define (honer-eval x coefficient-sequence)
  (accumulate
    (lambda (this-coeff higher-terms) (+ this-coeff (* higher-terms x))
    0
    coefficient-sequence)))

(define (accmulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accmulate op initial (cdr sequence)))))

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))