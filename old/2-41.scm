;ある整数n以下の異なる正の整数が大小順に並んだ三つ組i,j,kの中で
;合計がある整数sとなるものすべてを見つける手続きを書け。

;整数nに対し、1≤j<i≤nとなるペア(i,j)の列を生成する手続きunique-pairsを定義せよ
(define (unique-trio n)
  (flatmap (lambda (i)
                   (flatmap (lambda (j)
                                    (map (lambda (k) (list i j k))
                                         (enumerate-interval 1 (- j 1))))
                            (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (sum-of-trio trio)
  (+ (car trio) (cadr trio) (cadr (cdr trio))))

(define (equal-sum-of-trio n s)
  (filter (lambda (x) (= (sum-of-trio x) s)) (unique-trio n)))

