#lang racket

; Exercise 2.18

; iterative
(define (reverse items)
  (define (collect items result)
    (if (null? items)
        result
        (collect (cdr items) (cons (car items) result))))
  (collect items '()))

; recursive
(define (reverse-r items)
  (if (null? items)
      '()
      (append (reverse-r (cdr items)) (list (car items)))))

