#lang racket

; Exercise 1.12

(define (pascal r e)
  ; r should be integer >= 0
  ; r is row, e is element in row -- both are zero-indexed
  (cond
    ((> e r) 0)
    ((< e 0) 0)
    ((= r 0) 1)
    (else (+ (pascal (- r 1) e) (pascal (- r 1) (- e 1))))))
