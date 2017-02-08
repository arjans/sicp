#lang racket

; Exercise 1.18

(define (* a b)
  (*-iter 0 a b))

(define (*-iter r a b)
  (cond
    ((= b 1) (+ r a))
    ((even? b) (*-iter r (double a) (halve b)))
    (else (*-iter (+ r a) (double a) (halve b)))))

(define (even? x)
  (= (remainder x 2) 0))

(define (double x)
  (+ x x))

(define (halve x)
  (floor (/ x 2)))
