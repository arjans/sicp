#lang racket

; Exercise 2.59

(define (union-set s1 s2)
  (cond ((and (null? s1) (null? s2)) '())
        ((null? s1) s2)
        ((not (element-of-set? (car s1) s2))
         (cons (car s1)
               (union-set (cdr s1) s2)))
        (else (union-set (cdr s1) s2))))
