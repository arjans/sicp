#lang racket

; Exercise 2.07

(define (lower-bound i)
  (car i))

(define (upper-bound i)
  (cdr i))

(define lower-bound car)
(define upper-bound cdr)

