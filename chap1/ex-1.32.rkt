#lang racket

; Exercise 1.32

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (accumulate combiner null-value term a next b)
  (define (iter result x)
    (if (> x b)
        result
        (iter (combiner result (term x)) (next x))))
  (iter null-value a))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))
