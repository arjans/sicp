#lang racket

; Exercise 2.60

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set))) #t
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (union-set s1 s2)
  (append s1 s2))

(define (intersection-set s1 s2)
  (cond ((or (null? s1) (null? s2)) '())
        ((element-of-set? (car s1) s2)
         (cons (car s1) (intersection-set (cdr s1) s2)))
        (else (intersection-set (cdr s1) s2))))

; Element of set has the same time complexity in both.
; Adjoin-set is O(1) here, O(n) in the example.
; Union-set here is whatever the time complexity is of append (probably O(n)).
; In exercise 2.59, union-set is O(n^2)
; Intersection-set has the same time complexity, O(n^2), in both.
; Of course, n could be way bigger here than in the book.
; If n will stay small and you care a lot about adjoin-set and union-set, then non-unique sets would be better.
