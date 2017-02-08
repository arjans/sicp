#lang racket

; Exercise 2.35

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (not (pair? x)) 1 (count-leaves x))) t)))

