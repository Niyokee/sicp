(define (fold-right-reverse sequence)
  (fold-right (lambda (y x) (append x (list y))) '() sequence))

(define (fold-left-reverse sequence)
  (fold-left (lambda (y x) (cons x y)) '() sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accmulate op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
          (if (null? rest)
               result
              (iter (op result (car rest)) (cdr rest))))
          (iter initial sequence))

(define (accmulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accmulate op initial (cdr sequence)))))