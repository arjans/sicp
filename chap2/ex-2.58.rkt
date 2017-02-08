#lang racket

; Exercise 2.58

; a.

(define (sum? x)
  (and (pair? x) (eq? (cadr x) 'x)))

(define (addend x)
  (car x))

(define (augend x)
  (caddr x))

