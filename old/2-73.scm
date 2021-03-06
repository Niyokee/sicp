(define (install-sum-package)
    ; internal
    (define (addend s) (cadr s))

    (define (augened s) (caddr s))

    (define (=number? exp num)
    (and (number? exp) (= exp num)))

    (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))

    (define (deriv-sum exp var)
        (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))

  ;; システムの他の部分とのインターフェース
  (put 'make '+ make-sum)
  (put 'deriv '+ deriv-sum)
'done)

(define (install-product-package)
    (define (multiplier p) (cadr p))
    (define (multiplicand p) (caddr p))

    (define (=number? exp num)
        (and (number? exp) (= exp num)))

    (define (make-product m1 m2)
        (cond ((or (=number? m1 0) (=number? m2 0)) 0)
              ((=number? m1 1) m2)
              ((=number? m2 1) m1)
              ((and (number? m1) (number? m2)) (* m1 m2))
              (else (list '* m1 m2))))

    (define (deriv-product exp var)
        (make-sum
            (make-product (multiplier exp)
                    (deriv (multiplicand exp) var))
            (make-product (deriv (multiplier exp) var)
                    (multiplicand exp))))
  ;; 他の部分とのインターフェース
  (put 'make '* make-product)
  (put 'deriv '* deriv-product)
  'done)