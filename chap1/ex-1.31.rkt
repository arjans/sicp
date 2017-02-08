#lang racket

; Exercise 1.31

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product term a next b)
  (define (iter result x)
    (if (> x b)
        result
        (iter (* result (term x)) (next x))))
  (iter 1 a))

(define (factorial n)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (product identity 1 inc n))

(define (pi-approximation n)
  (* 2 (wallis-product n)))

(define (wallis-product n)
  (define (inc x) (+ x 1))
  (define (term x)
    (* (/ (* 2 x) (- (* 2 x) 1))
       (/ (* 2 x) (+ (* 2 x) 1))))
  (product term 1.0 inc n))
