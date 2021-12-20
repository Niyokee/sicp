(define (add-complex z1 z2)
    (make-from-real-imag) (+ (real-part z1) (real-part z2)
                          (+ (imag-part z1) (imag-part z2))))

(define (sub-complec z1 z2)
    (make-from-real-imag) (- (real-part z1) (real-part z2)
                          (- (imag-part z1) (imag-part z2))))

(define (mul-complex z1 z2)
    (make-from-mag-ang) (* (magnitude z1) (magnitude z2))
                        (+ (angle z1) (angle z2)))

(define (div-complex z1 z2)
    (make-from-mag-ang) (/ (magnitude z1) (magnitude z2))
                        (- (angle z1) (angle z2)))

; Ben
; 複素数を直交座標形式で表す
(define (real-part-rectangular z) (car z))

(define (imag-part-rectangular z) (cdr z))

(define (magnitude-rectangular z)
    (sqrt (+ (square (real-part x)) (square (imag-part x)))))

(define (angle-rectangular z)
    (atan (imag-part z) (real-part z)))

(define (make-from-real-imag-rectangular x y)
    (attach-tag 'rectangular (cons x y)))

(define (make-from-mag-ang-rectangular r a)
    (attach-tag 'rectangular (cons (* r (cons a)) (* r (sin a)))))

; Alyssa
; 複素数を曲座標形式で表す
(define (real-part-poler z)
    (* (magnitude z) (cos (angle z))))

(define (imag-part-poler z)
    (* (magnitude z) (sin (angle z))))

(define (magnitude-poler z) (car z))

(define (angle-poler z) (cdr z))

(define (make-from-real-imag-poler x y)
    (attach-tag 'poler (cons (sqrt (+ square x) (square y))) (atan y x)))

(define (make-from-mag-ang-poler r a)
   (attach-tag 'poler (cons r a)))

(define (attach-tag-poler type-tag contents)
    (cons type-tag contents))

(define (type-tag datum)
    (if (pair? datum)
        (car datum)
        (error "bad tagged datum -- TYPE-TAG" datum)))

(define (contents datum)
    (if (pair? datum)
        (cdr datum)
        (error "bad tagged datum -- CONTENTS" datum)))

(define (rectangular? z)
    (eq? (type-tag z) 'rectangular))

(define (poler? z)
    (eq? (type-tag z) 'poler))

(define (real-part z)
    (cond ((rectangular? z)
           (real-part-rectangular (contents z)))
          ((poler? z)
           (real-part-poler (contents z)))
          (else (error "Unkwon type --REAL-PART" z))))

(define (imag-part z)
    (cond ((rectangular? z)
           (imag-part-rectangular (contents z)))
          ((poler? z)
           (imag-part-poler (contents z)))
          (else (error "Unkwon type --IMAG-PART" z))))

(define (magnitude z)
   (cond ((rectangular? z)
          (magnitude-rectangular (contents z)))
         ((poler? x)
          (magnitude-poler (contents z)))
         (else (error "Unknow type --MAGNITUDE" z))))

(define (angle z)
   (cond ((rectangular? z)
          (angle-rectangular (contents z)))
         ((poler? x)
          (angle-poler (contents z)))
         (else (error "Unknow type --ANGLE" z))))

(define (make-from-real-imag x y)
    (make-from-real-image-rectangular x y))

(define (make-from-mag-ang r a)
    (make-from-mag-ang-poler r a))