#lang racket

; Exercise 1.33

(define (filtered-accumulate combiner null-value term a next b predicate)
  (if (> a b)
      null-value
      (if (predicate a)
          (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b predicate))
          (filtered-accumulate combiner null-value term (next a) next b predicate))))

(define (filtered-accumulate combiner null-value term a next b predicate)
  (define (iter result x)
    (if (> x b)
        result
        (if (predicate x)
            (iter (combiner result (term x)) (next x))
            (iter result (next x)))))
  (iter null-value a))

(define (sum-squares a b)
  (filtered-accumulate + 0 identity a inc b prime?))

(define (relative-prime-sum n)
  (define (relative-prime? x)
    (= (gcd x n) 1))
  (filtered-accumulate + 0 identity 1 inc n relative-prime?))
