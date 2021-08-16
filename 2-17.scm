(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))
(display (last-pair (list 23 72 149 34)))

