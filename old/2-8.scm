(define (make-interval a b) (cons a b))

(define (upper-bound x) (car x))
(define (lower-bound x) (cdr x))

;区間オブジェクトの car は最小の値で、 cdr は最大の値になるようにする
;片方の区間の最小値から、もう片方の区間の最大値を引けば良い。cdr はその逆。
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
