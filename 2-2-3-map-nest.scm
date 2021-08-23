
; マップのネスト
; (accmulate append
;            '()
;            (map (lambda (i)
;                   (map (lambda (j) (list i j))
;                        (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 n)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;マップと集積を append によって組み合わせる
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
    (filter prime-sum? (flatmap
                         (lambda (i)
                           (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1))))
                           (enumerate-interval 1 n)))))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item))) sequence))

(define (permutations s)
  (if (null? s) ; 集合は空か?
      (list '()) ; 空集合を持つ列
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p)) (permutations (remove x s)))) s)))

(print (permutations (list 1 2 3 4)))