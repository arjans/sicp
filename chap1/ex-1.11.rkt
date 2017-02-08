#lang racket

; CHALLENGE
; Rewrite the counting change problem iteratively.

; Exercise 1.11

; Recursive definition

(define (f n)
  (cond
    ((< n 3) n)
    (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

; Iterative definition, modeled on iterative Fibonacci from section 1.2.2
; Helps to draw out a chart of n-1, n-2, n-3 values starting from 3

(define (g n)
  (g-iter 2 1 0 n))

(define (g-iter a b c count)
  (if (= count 0)
      c
      (g-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
