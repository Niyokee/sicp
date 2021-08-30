(load "./2-63.scm")

(define (lookup given-key set)
    (cond ((null? set) #f)
          ((= given-key (key (entry set))) #t)
          ((< given-key (key (entry set))) (lookup given-key (left-branch set)))
          ((> given-key (key (entry set))) (lookup given-key (righ-branch set)))))