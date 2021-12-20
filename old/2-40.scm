;整数nに対し、1≤j<i≤nとなるペア(i,j)の列を生成する手続きunique-pairsを定義せよ
(define (unique-pairs n)
  (flatmap
    (lambda (i)
            (map (lambda (j) (list i j))
                 (enumerate-interval 1 (- i 1))))
      (enumerate-interval 1 n)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

;マップと集積を append によって組み合わせる
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
    (filter prime-sum? (unique-pairs n))))

(print (prime-sum-pairs 6))