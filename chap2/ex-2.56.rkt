#lang racket

; Exercise 2.56

(define (deriv ...)
  ...
  ((exponentiation? exp)
   (make-product (exponent exp)
                 (make-exponent (base exp) (- (exponent exp) 1))
                 (deriv (base exp) var)))
  ...)

(define (exponentiation? x)
  (and (eq? '** (car x)) (pair? x)))

(define (base e)
  (cadr e))

(define (exponent e)
  (caddr e))

(define (make-exponent b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((and (number? b) (number? e)) (expt b e))
        (else (list '** b e))))
