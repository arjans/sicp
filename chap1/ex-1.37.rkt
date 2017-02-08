#lang racket

; Exercise 1.37

(define (cont-frac n d k)
  (define (recurse x)
    (if (> x k)
        0
        (/ (n x) (+ (d k) (recurse (+ x 1))))))
  (recurse 1))

(define (cont-frac n d k)
  (define (iter result x)
    (if (= x 0)
        result
        (iter (/ (n k) (+ (d k) result)) (- x 1))))
  (iter 0 k))

(define (inverse-phi)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             11))
