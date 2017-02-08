#lang racket

; Exercise 1.29

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (term k)
    (*
     (cond
      ((= k 0) 1)
      ((= k n) 1)
      ((odd? k) 4)
      (else 2))
     (f (+ a (* k h)))))
  (* (/ h 3) (sum term 0 inc n)))

(define (cube x)
  (* x x x))

(define (odd? x)
  (= (remainder x 2) 1))

(define (inc x)
  (+ x 1))
