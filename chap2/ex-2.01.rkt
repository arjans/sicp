#lang racket

; Exercise 2.01

(define (make-rat n d)
  (if (> (* n d) 0)
      (cons (abs n) (abs d))
      (cons (* -1 (abs n)) (abs d))))

