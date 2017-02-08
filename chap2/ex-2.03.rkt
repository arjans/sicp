#lang racket

; Exercise 2.03

; Version 1

(define (square x)
  (* x x))

(define (length-segment s)
  (let ((a (start-segment s))
        (b (end-segment s)))
    (sqrt
     (+
      (square (- (x-point a) (x-point b)))
      (square (- (y-point a) (y-point b)))))))

(define (make-rectangle s1 s2)
  (cons s1 s2))

(define (height-rectangle r)
  (length-segment (car r)))

(define (width-rectangle r)
  (length-segment (cdr r)))

; Version 2

(define (make-rectangle o h w)
  (cons o (cons h w)))

(define (height-rectangle r)
  (cadr r))

(define (width-rectangle r)
  (cddr r))

(define (area-rectangle r)
  (* (height-rectangle r) (width-rectangle r)))

(define (perimeter-rectangle r)
  (* 2 (+ (height-rectangle r) (width-rectangle r))))

