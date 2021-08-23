(define wave2 (beside wave (filp-vert wave)))
(define wave4 (below wave2 wave2))

;wave4の抽象化
(define (flipped-pairs painter)
    (let ((painter2 (beside painter (flip-vert painter))))
      (below painter2 painter2)))

(define (wave4 (flipped-pairs wave)))

(define (right-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (right-split painter (- n 1))))
            (beside painter (below smaller smaller)))))

(define (up-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (up-split painter (- n 1))))
            (below painter (beside smaller smaller)))))

(define (corner-split painter n)
    (if (= n 0)
        painter
        (let ((up (up-split painter (- n 1)))
              (right (right-split painter (- n 1))))
            (let ((top-left (beside up up))
                  (bottom-right (below right right))
                  (corner (corner-split painter (- n 1))))
                (beside (below painter top-left))
                        (below bottom-right corber)))))

(define (square-limit painter n)
    (let ((quater (corner-split painter n)))
        (let ((half (beside (flip-horiz quater) quater)))
            (below (flep-vert half) half))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
      (let ((top (beside (tl painter) (tr painter)))
           (bottom (beside (bl painter) (br painter))))
        (below bottom top))))

(define (fliped-pairs painter)
    (let ((combined4 (square-of-four identity flip-vert identity flip-vert)))
        (combined4 painter)))

(define (square-limit painter n)
    (let ((combined4 (square-of-four flip-horiz identity routate180 flip-vert)))
        (combined4 (conrer-split painter n))))

(define (frame-coord-map frame)
    (lambda (v) (add-vect
        (origin-frame frame)
        (add-vect (scale-vect (xcor-vect v)
                              (edge1-frame frame))
                  (scale-vect (ycor-vect v)
                              (edge2-frame frame))))))
