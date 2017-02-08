#lang racket

; Exercise 1.22
; The sqrt(10) relationship still holds with every increase in magnitude.
; But it can only really be seen at 1B vs 10B.

(define (search-for-primes a b)
  (search-for-primes-iter 3
                          (if (odd? a) a (+ a 1))
                          (if (odd? b) b (+ b 1))))

(define (search-for-primes-iter n a b)
  (cond ((> a b) (display " done "))
        ((= n 0) (display " done "))
        ((prime? a)
         (timed-prime-test a)
         (search-for-primes-iter (- n 1) (+ a 2) b))
        (else (search-for-primes-iter n (+ a 2) b))))

(define (timed-prime-test n)
 (newline)
 (display n)
 (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
 (if (prime? n)
     (report-prime (- (current-milliseconds) start-time))
     (display " not prime ")))

(define (report-prime elapsed-time)
 (display " *** ")
 (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

(define (odd? n)
  (= (remainder n 2) 1))
