#lang racket

; Exercise 3.69

(define (stream-take n s)
  (if (= n 0)
      '()
      (cons (stream-first s) (stream-take (- n 1) (stream-rest s)))))

(define integers
  (stream-cons 1 (stream-map (lambda (x) (+ x 1)) integers)))

(define (interleave s1 s2)
  (if (stream-empty? s1)
      s2
      (stream-cons (stream-first s1)
                   (interleave s2 (stream-rest s1)))))

(define (weighted-interleave f s1 s2)
  (cond ((stream-empty? s1) s2)
        ((stream-empty? s2) s1)
        ((< (f (stream-first s1)) (f (stream-first s2)))
         (stream-cons (stream-first s1)
                      (weighted-interleave f (stream-rest s1) s2)))
        (else (stream-cons (stream-first s2)
                           (weighted-interleave f s1 (stream-rest s2))))))

(define (pairs s1 s2)
  (stream-cons (list (stream-first s1) (stream-first s2))
               (interleave (stream-map
                            (lambda (x) (list (stream-first s1) x))
                            (stream-rest s2))
                           (pairs (stream-rest s1) (stream-rest s2)))))

(define (ordered-pairs s1 s2)
  (stream-cons (list (stream-first s1) (stream-first s2))
               (weighted-interleave
                (lambda (x) (+ (car x) (cadr x)))
                (stream-map
                 (lambda (x) (list (stream-first s1) x))
                 (stream-rest s2))
                (ordered-pairs (stream-rest s1) (stream-rest s2)))))
  

(define (triples s1 s2 s3)
  (stream-cons (list (stream-first s1) (stream-first s2) (stream-first s3))
               (interleave (stream-map
                            (lambda (x) (cons (stream-first s1) x))
                            (pairs s2 (stream-rest s3)))
                           (triples (stream-rest s1)
                                    (stream-rest s2)
                                    (stream-rest s3)))))

(define (ordered-triples s1 s2 s3)
  (stream-cons (list (stream-first s1) (stream-first s2) (stream-first s3))
               (weighted-interleave
                (lambda (x) (+ (car x) (cadr x) (caddr x)))
                (stream-map
                 (lambda (x) (cons (stream-first s1) x))
                 (pairs s2 (stream-rest s3)))
                (ordered-triples (stream-rest s1)
                                 (stream-rest s2)
                                 (stream-rest s3)))))

(define (pythagorean-triples)
  (define (square x) (* x x))
  (stream-filter (lambda (x) (= (+ (square (car x)) (square (cadr x)))
                                (square (caddr x))))
                 (ordered-triples integers (stream-rest integers) (stream-rest (stream-rest integers)))))

; Project Euler Problem 9

; All pairs (i,j) where i < j
(define ps (pairs integers (stream-rest integers)))
(define ordered-ps (ordered-pairs integers (stream-rest integers)))

; All triples (i,j,k) where i < j < k
(define ts (triples integers (stream-rest integers) (stream-rest (stream-rest integers))))
(define ordered-ts (ordered-triples integers (stream-rest integers) (stream-rest (stream-rest integers))))

; very slow
(define (find-pythagorean-sum n)
  (define (iter s)
    (let ((x (stream-first s)))
      (if (= n (+ (car x) (cadr x) (caddr x)))
          x
          (iter (stream-rest s)))))
  (iter (pythagorean-triples)))

; not as slow
(define (find-pythagorean-sum-2 n)
  (define (iter s)
    (let* ([a (car (stream-first s))]
           [b (cadr (stream-first s))]
           [c (- n a b)])
      (if (= (+ (* a a) (* b b)) (* c c))
          (list a b c)
          (iter (stream-rest s)))))
  (iter ordered-ps))
