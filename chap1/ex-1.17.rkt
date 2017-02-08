#lang racket

; Exercise 1.17

(define (* a b)
  (cond
    ((= b 1) a)
    ((even? b) (* (double a) (halve b)))
    (else (+ a (* (double a) (halve b))))))

(define (even? x)
  (= (remainder x 2) 0))

(define (double x)
  (+ x x))

(define (halve x)
  (floor (/ x 2)))
