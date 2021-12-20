(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map cons (filter car seqs)))
            (accumulate-n op init (map cons (filter cdr seqs)))))

(define (filter predicate sequence)
　(cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))