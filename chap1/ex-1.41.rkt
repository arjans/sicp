#lang racket

; Exercise 1.41

(define (double f)
  (lambda (x) (f (f x))))
