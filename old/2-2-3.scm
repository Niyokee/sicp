; (define (sum-odd-squares tree)
;   (cond ((null? tree) 0)
;         ((not (pair? tree)) (if (odd? tree) (square tree) 0))
;         (else (+ (sum-odd-squares (car tree))
;                  (sum-odd-squares (cdr tree))))))

(define (event-fibs n)
  (define (next k)
    (if (> k n)
        nil
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ 1 k))))))
  (next 0))

(define (filter predicate sequence)
　(cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accmulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accmulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))


(define (sum-odd-squares tree)
  (accmulate + 0 (map square (filter odd? (enumerate-tree tree)))))

(print (sum-odd-squares (list 1 (list 2 (list 3 4)) 5)))

(define (even-fibs n)
  (accmulate cons '() (filter even? (map fib (enumerate-interval 0 n)))))

(print (even-fibs 5))

(define (list-fib-squares n)
  (accmulate cons '() (map fib ())))

; マップのネスト
(accmulate append
           '()
           (map (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 n)))

(define (accmulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accmulate op initial (cdr sequence)))))

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
      (list ) ; 空集合を持つ列
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p)) (permutations (remove x s)))) s)))

(permutations (list 1 2 3))

