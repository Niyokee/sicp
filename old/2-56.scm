(load "./2-3-2.scm")

(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp)
              (if (same-variable? exp var) 1 0))
          ((sum? exp)
              (make-sum (deriv (addend exp) var)
                        (deriv (augened exp) var)))
          ((product? exp)
              (make-sum
                  (make-product (multiplier exp)
                                (deriv (multiplicand exp) var))
                  (make-product (deriv (multiplier exp) var)
                                (multiplicand exp))))
          ((exponentiation? exp)
              (make-product
                  (make-product
                    (exponent exp)
                    (make-exponentiation (base exp) (- (exponent exp) 1)))
                  (deriv (base exp) var)))
          (else
              (error "unknown expression type -- DERIV" exp))))

(define (base s) (cadr s))

(define (exponent s) (caddr s))

(define (exponentiation? x)
    (and (pair? x) (eq? (car x) '**)))

(define (make-exponentiation base exponent)
    (cond ((=number? exponent 0) 1)
          ((=number? exponent 1) base)
          (else (list '** base exponent))))