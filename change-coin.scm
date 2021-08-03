(use slib)
(require 'trace)

(define (count-change amount) (cc amount 5))
  (define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= kinds-of-coins 0)) 0)
          (else (+ 
                   (cc amount (- kinds-of-coins 1))
                   (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(trace count-change)
(trace cc)
(count-change 10)

;10cent 5 coins
(cc 10 5)
(+ cc 10 (- 5 1)) (cc (- 10 (first-denomination 5)) 5)))))
;  1------------- 2-----------------------------------
(+ (cc 10 4) (cc -40 5))
;amout=10 kinds-of-coins=4
(+ (cc 10 4) (cc -40 5))
(+ (+ (cc 10 (- 4 1)) (cc (- 10 (first-denomination 4)) 4)) (cc -40 5))
;      1------------- 2-----------------------------------
;amout=10 kinds-of-coins=3
(+ (+ (cc 10 3) (cc -15 4)) (cc -40 5))
(+ (+ (+ (cc 10 (- 3 1)) (cc (- 10 (first-denomination 3)) 3)) (cc -15 4)) (cc -40 5))
;         1------------- 2-----------------------------------
(+ (+ (+ (cc 10 2) (cc 0 3)) (cc -15 4)) (cc -40 5))

