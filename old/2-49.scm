(define (segments->painter segment-list)
    (lambda (frame)
        (for-each
            (lambda (segment)
                (draw-line
                    ((frame-coord-map frame) (start-segment segment))
                    ((frame-coord-map frame) (end-segment segment))))
    segment-list)))

(define (make-segment v1 v2) (cons v1 v2))
(define (start-segment v) (car v))
(define (end-segment v) (cdr v))

(define (make-vect x y) (cons x y))

(print (make-segment (make-vect 1 2) (make-vect 4 5)))
(print (start-segment (make-segment (make-vect 1 2) (make-vect 4 5))))
(print (end-segment (make-segment (make-vect 1 2) (make-vect 4 5))))

(define draw-frame-outline
  (let ((v0 (make-vect 0.0 0.0))
        (v1 (make-vect 1.0 0.0))
        (v2 (make-vect 1.0 1.0))
        (v3 (make-vect 0.0 1.0)))
       (segments->painter
         (list (make-segment v0 v1)
               (make-segment v1 v2)
               (make-segment v0 v3)
               (make-segment v3 v2)))))

(define draw-frame-cross
  (let ((v0 (make-vect 0 0))
        (v1 (make-vect 1 0))
        (v2 (make-vect 1 1))
        (v3 (make-vect 0 1)))
       (segments->painter
         (list (make-segment v0 v2)
               (make-segment v1 v3)))))

(define draw-frame-diamond
  (let ((v0 (make-vect 0.5 0.0))
        (v1 (make-vect 1.0 0.5))
        (v2 (make-vect 0.5 1.0))
        (v3 (make-vect 0.0 0.5)))
   (segments->painter
     (list (make-segment v0 v1)
           (make-segment v1 v2)
           (make-segment v2 v3)
           (make-segment v3 v0)))))

(define wave
  (segments->painter
    (list (make-segment (make-vect 0.35 0.85) (make-vect 0.40 1.00))
          (make-segment (make-vect 0.65 0.85) (make-vect 0.60 1.00))
          (make-segment (make-vect 0.35 0.85) (make-vect 0.40 0.65))
          (make-segment (make-vect 0.65 0.85) (make-vect 0.60 0.65))
          (make-segment (make-vect 0.60 0.65) (make-vect 0.75 0.65))
          (make-segment (make-vect 0.40 0.65) (make-vect 0.30 0.65))
          (make-segment (make-vect 0.75 0.65) (make-vect 1.00 0.35))
          (make-segment (make-vect 0.60 0.45) (make-vect 1.00 0.15))
          (make-segment (make-vect 0.60 0.45) (make-vect 0.75 0.00))
          (make-segment (make-vect 0.50 0.30) (make-vect 0.60 0.00))
          (make-segment (make-vect 0.30 0.65) (make-vect 0.15 0.60))
          (make-segment (make-vect 0.30 0.60) (make-vect 0.15 0.40))
          (make-segment (make-vect 0.15 0.60) (make-vect 0.00 0.85))
          (make-segment (make-vect 0.15 0.40) (make-vect 0.00 0.65))
          (make-segment (make-vect 0.30 0.60) (make-vect 0.35 0.50))
          (make-segment (make-vect 0.35 0.50) (make-vect 0.25 0.00))
          (make-segment (make-vect 0.50 0.30) (make-vect 0.40 0.00)))))
