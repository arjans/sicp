#lang racket

; Exercise 1.36

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.00001))
  (define (try guess)
    (let ((next (f guess)))
      (cond ((close-enough? guess next)
             next)
            (else
             (display next)
             (newline)
             (try next)))))
  (try first-guess))

(define (phi)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(define (test)
  (fixed-point (lambda (x) (average (/ (log 1000) (log x)) x)) 1.1))

(define (average a b)
  (/ (+ a b) 2))
