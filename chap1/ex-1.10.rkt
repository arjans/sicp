#lang racket

; Exercise 1.10

(define (f n) (A 0 n)) ; 2x
(define (g n) (A 1 n)) ; 2^x
(define (h n) (A 2 n)) ; 2^2^x
(define (j n) (A 3 n)) ; 2^2^2^2^2... n times
(define (k n) (* 5 n n)) ; 5x^2
