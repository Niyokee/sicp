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
          (else
              (error "unknown expression type -- DERIV" exp))))

; 変数は記号とする symbol?で識別できる
(define (variable? x) (symbol? x))

; 2つの変数はそれを表現している記号がeq?なら同じである
(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

; 和と積はリストとして構成する
; (define (make-sum a1 a2) (list '+ a1 a2))

; 式が与えられた数に等しいかを見る手続き
(define (=number? exp num)
    (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list a1 '+ a2))))

; (define (make-product m1 m2) (list '* m1 m2))

(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list m1 '* m2))))

(define (sum? x)
    (and (pair? x) (eq? (cadr x) '+)))

(define (addend s) (car s))

(define (augened s) (caddr s))

(define (product? x)
    (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p) (caddr p))
