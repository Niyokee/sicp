(define (accmulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accmulate op initial (cdr sequence)))))

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define (count-leaves t)
(accumulate + 0 (map (lambda (x) 1) enumerate-tree t)))

(define (enumerate-tree tree) (cond ((null? tree) nil)
  ((not (pair? tree)) (list tree))
  (else (append (enumerate-tree (car tree))
                (enumerate-tree (cdr tree))))))