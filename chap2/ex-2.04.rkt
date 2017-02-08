#lang racket

; Exercise 2.04

(define (cdr z)
  (z (lambda (p q) q)))

