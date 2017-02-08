#lang racket

; Exercise 1.38

(define (e)
  (define (d i)
    (if (= (remainder i 3) 2)
        (* 2 (ceiling (/ i 3)))
        1))
  (+ 2 (cont-frac (lambda (i) 1.0)
                  d
                  20)))
