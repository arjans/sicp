#lang racket

; SICP Exercise 3.71
; Generate an infinite stream of Ramanujan numbers.

;
; Code from doing Exercises 3.69 and 3.70
;
(define (stream-take s n)
  (if (= n 0)
      '()
      (cons (stream-first s) (stream-take (stream-rest s) (- n 1)))))

(define integers
  (stream-cons 1 (stream-map (lambda (x) (+ x 1)) integers)))

(define (weighted-pairs f s1 s2)
  (stream-cons (list (stream-first s1) (stream-first s2))
               (weighted-interleave
                (lambda (x) (f (car x) (cadr x)))
                (stream-map
                 (lambda (x) (list (stream-first s1) x))
                 (stream-rest s2))
                (weighted-pairs f (stream-rest s1) (stream-rest s2)))))

(define ordered-ps (weighted-pairs + integers (stream-rest integers)))

(define (weighted-interleave f s1 s2)
  (cond ((stream-empty? s1) s2)
        ((stream-empty? s2) s1)
        ((< (f (stream-first s1)) (f (stream-first s2)))
         (stream-cons (stream-first s1)
                      (weighted-interleave f (stream-rest s1) s2)))
        (else (stream-cons (stream-first s2)
                           (weighted-interleave f s1 (stream-rest s2))))))

;
; Solution to current exercise.
;
(define (cube x) (* x x x))

(define S (weighted-pairs (λ (x y) (+ (cube x) (cube y)))
                          integers
                          (stream-rest integers)))

;
; Find all consecutive elements in a stream that are equal according to some f.
;
(define (filter-consecutive f s)
  (cond
    [(stream-empty? s) '()]
    [(stream-empty? (stream-rest s)) '()]
    [(= (f (stream-ref s 1)) (f (stream-ref s 2)))
     (stream-cons (list (stream-ref s 1) (stream-ref s 2) (f (stream-ref s 1)))
                  (filter-consecutive f (stream-rest s)))]
    [else (filter-consecutive f (stream-rest s))]))

;
; Stream of Ramanujan numbers, with the (i,j) pairs that generate them.
;
; Usage:
; (stream-take ramanujan-numbers 5)
;  => '(((9 10) (1 12) 1729)
;       ((9 15) (2 16) 4104)
;       ((18 20) (2 24) 13832)
;       ((19 24) (10 27) 20683)
;       ((18 30) (4 32) 32832))
;
(define ramanujan-numbers
  (filter-consecutive (λ (x) (+ (cube (car x)) (cube (cadr x)))) S))