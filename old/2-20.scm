(define (same-parity first . numbers)
  (define (iter numbers result)
    (cond ((null? numbers)
            result)
          ((same-remainder? first (car numbers))
           (iter (cdr numbers) (cons (car numbers) result)))
          (else
           (iter (cdr numbers) (cons '() result))))
    (iter numbers '())))

(define (same-remainder? a b)
  (= (remainder a 2) (remainder b 2))

(same-parity 1 2 3 4 5)
; (display (same-parity 1 2 3 4 5))