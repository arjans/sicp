#lang racket

; Exercise 2.17

(define (last-pair items)
  (cond ((null? items) #f)
        ((null? (cdr items)) items)
        (else (last-pair (cdr items)))))

