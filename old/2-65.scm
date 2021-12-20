(define set1 '(1 2 3 4 5))
(define set2 '(2 4 6))
(define tree1 (list->tree set1))
; (3 (1 () (2 () ())) (4 () (5 () ())))
(define tree2 (list->tree set2))
; (4 (2 () ()) (6 () ()))

(define (union-tree tree1 tree2)
  (let ((set1 (tree->list tree1))
        (set2 (tree->list tree2)))
       (list->tree (union-set set1 set2))))

(union-tree tree1 tree2)
gosh> (3 (1 () (2 () ())) (5 (4 () ()) (6 () ())))

(define (intersection-tree tree1 tree2)
  (let ((set1 (tree->list tree1))
        (set2 (tree->list tree2)))
       (list->tree (intersection-set set1 set2))))

(intersection-tree tree1 tree2)
gosh> (2 () (4 () ()))