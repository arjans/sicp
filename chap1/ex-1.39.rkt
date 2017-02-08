#lang racket

; Exercise 1.39

(define (cont-frac n d k)
  (define (iter result x)
    (cond ((= x 0)
           result)
          (else
           (display (n x))
           (newline)
           (iter (/ (n x) (- (d x) result)) (- x 1)))))
  (iter 0 k))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (* x x)))
  (define (d i)
    (- (* i 2) 1))
  (cont-frac n d k))
