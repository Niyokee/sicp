(define (make-interval a b) (cons a b))

(define (upper-bound x) (car x))
(define (lower-bound x) (cdr x))

;区間オブジェクトの car は最小の値で、 cdr は最大の値になるようにする
;片方の区間の最小値から、もう片方の区間の最大値を引けば良い。cdr はその逆。
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
		   (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
   (let ((p1 (* (lower-bound x) (lower-bound y)))
	 (p2 (* (lower-bound x) (upper-bound y)))
	 (p3 (* (upper-bound x) (lower-bound y)))
	 (p4 (* (upper-bound x) (upper-bound y))))
     (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (div-interval x y)
    (if (and (< (lower-bound y) 0) (> (upper-bound y) 0))
        (error "error")
        (mul-interval x
		   (make-interval (/ 1.0 (upper-bound y))
				  (/ 1.0 (lower-bound y))))))

(define foo (make-interval 3.14 4.56))
(define bar (make-interval -5.25 6.33))
(print (div-interval foo bar))
