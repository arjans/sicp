#lang racket

; Exercise 2.02

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment a b)
  (cons a b))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (let ((a (start-segment s))
        (b (end-segment s)))
    (make-point (/ (+ (x-point a)
                      (x-point b))
                   2)
                (/ (+ (y-point a)
                      (y-point b))
                   2))))

