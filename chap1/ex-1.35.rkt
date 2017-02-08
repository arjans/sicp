#lang racket

; Exercise 1.35

(define (phi)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
