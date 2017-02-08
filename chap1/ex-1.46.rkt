#lang racket

; Exercise 1.46

(define (iterative-improve good-enough improve)
  (define (improver guess)
    (if (good-enough guess)
        guess
        (improver (improve guess))))
  improver)

(define (sqrt x)
  ((iterative-improve
    (lambda (guess) (< (abs (- (square guess) x)) 0.001))
    (lambda (guess) (average guess (/ x guess))))
   1.0))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.00001))
  ((iterative-improve
    (lambda (guess) (close-enough? guess (f guess)))
    f)
   first-guess))
