#lang racket

; Exercise 1.3

(define (square x)
  (* x x))

(define (sum-squares x y)
  (+ (square x) (square y)))

(define (sum-square-two-largest a b c)
  (cond
    ((and (< a b) (< a c)) (sum-squares b c))
    ((and (< b a) (< b c)) (sum-squares a c))
    (else (sum-squares b a))))
