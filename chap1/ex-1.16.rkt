#lang racket

; Exercise 1.16
; See also: Knuth Volume 2, section 4.6.3

(define (fast-expt b n)
  (expt-iter 1 b n))

(define (expt-iter a b n)
  (if (= n 0)
      a
      (expt-iter (if (= (modulo n 2) 0) a (* a b))
                 (square b)
                 (floor (/ n 2)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))
