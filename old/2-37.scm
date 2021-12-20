; accumulate手続きは、列の最初の要素と、右のすべての要素を組み合わせた結果とを組み合わせるため
; fold-rightとしても知られている
; fold-leftというものもあり、これはfold-rightに似ているが、要素の組み合わせを逆方向に行うという点が違う。
(define (fold-left op initial sequence)
  (define (iter result rest)
          (if (null? rest)
               result
              (iter (op result (car rest)) (cdr rest))))
          (iter initial sequence))

(print (fold-right / 1 (list 1 2 3)))
(print (fold-left / 1 (list 1 2 3)))
(print (fold-right list '() (list 1 2 3)))
(print (fold-left list '() (list 1 2 3)))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accmulate op initial (cdr sequence)))))