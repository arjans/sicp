#lang racket

; Exercise 2.20

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (same-parity f . r)
  (if (odd? f)
      (cons f (select odd? r))
      (cons f (select even? r))))

(define (select predicate list)
  (cond ((null? list) '())
        ((predicate (car list)) (cons (car list) (select predicate (cdr list))))
        (else (select predicate (cdr list)))))

(define (even? x)
  (= (remainder x 2) 0))

(define (odd? x)
  (= (remainder x 2) 1))

