(define (augend s)
  (if (null? (cdddr s))
      (caddr s)
      (cons '+ (cddr s))))

(define (multiplicand p)
    (if (null? (cdddr s))
        (caddr s)
        (cons '* (cddr s))))