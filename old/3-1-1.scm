(define balance 100)

; globalにbalanceを定義している
(define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient funds"))

; localにbalanceを閉じ込めた
(define new-withdraw
    (let ((balance 100))
        (lambda (amount)
            (if (>= balance amount)
                (begin (set! balance (- balance amount)) balance)
                "Insufficient funds"))))

(define (make-withdraw balance)
    (lambda (amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount)) balance)
            "Insufiicient funds")))

(define W1 (make-withdraw 100))
(define W2 (make-withdraw 100))

(define (make-account balance)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount)) balance)
            "Insufficient funds"))
    (define (deposite amount)
        (set! balance (+ balance amount)) balance)
    (define (dispatch m)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposite) deposite)
              (else (error "Unknown request: MAKE-ACCOUNT" m))))
    dispatch)

(define acc (make-account 100))
(print ((acc 'withdraw) 50))
(print ((acc 'deposite) 40))
(print ((acc 'withdraw) 60))

(define (make-decrementer balance)
    (lambda (amount)
        (- balance amount)))

(define D (make-decrementer 25))

(D 20)

((make-decrementer 25) 20)
((lambda (amount) (- 25 amount)) 20)
(- 25 20)
5

(define (make-simplified-withdraw balance)
    (lambda (amount)
        (set! balance (- balance amount))
        balance))
(define W (make-simplified-withdraw 25))
(W 20))

((make-simplified-withdraw 25) 20)
((lambda (amount) (set! balance (- 25 amount)) 25) 20)
((lambda (20) (set! balance (- 25 20)) 25) 20)
(set! balance (- 25 20)) 25)