(define rand (let ((x random-init))
                (lambda ()
                    (set! x (rand-update x)) x)))

(define (estimate-pi trails)
    (sqrt (/ 6 (monte-carlo trails cesaro-test))))

(define (cesaro-test)
    (= (gcd (rand) (rand)) 1))

(define (monte-carlo trails experiment)
    (define (iter trails-remaining trails-passed)
        (cond ((= trails-remaining 0)
               (/ trails-passed trails))
              ((experiment)
               (iter (- trails-remaining 1)
                     (+ trails-passed 1)))
              (else
                  (iter (- trails-remaining 1)
                        trails-passed))))
    (iter trails 0))

;=========================================================
(define (estimate-pi trails)
    (sqrt (/ 6 (random-gcd-test trails random-init))))
(define (random-gcd-test trails initial-x)
    (define (iter trails-remaining trails-passed x)
        (let ((x1 (rand-update x)))
            (let ((x2 (rand-update x1)))
                (cond ((= trails-remaining 0)
                       (/ trails-passed trails))
                      ((= (gcd x1 x2) 1)
                       (iter (- trails-remaining 1)
                             (+ trails-passed 1)
                            x2))
                (else
                    (iter (- trails-remaining 1)
                          trails-passed
                          x2))))))
    (iter trails 0 initial-x))