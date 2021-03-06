(define acc (make-account 100 'secret-passowrd))

(define (make-account balance, passowrd)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount)) balance)
            "Insufficient funds"))
    (define (deposite amount)
        (set! balance (+ balance amount)) balance)
    (define (dispatch pass m)
        (if (eq? pass password)
            (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposite) deposite)
                (else (error "Unknown request: MAKE-ACCOUNT" m)))
            (error "Incorrect Password" pass)))
dispatch)