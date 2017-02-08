#lang racket

; SICP Exercise 3.56

(require racket/stream)

;
; Enumerate Hamming numbers.
; Look at Haskell solutions on Rosetta Code.
;
(define S (stream-cons 1 (merge (stream-scale S 2)
                                (merge (stream-scale S 3)
                                       (stream-scale S 5)))))

(define (stream-scale s n)
  (stream-map (λ (x) (* x n)) s))

(define (stream-take s n)
  (if (= n 0)
      '()
      (cons (stream-first s) (stream-take (stream-rest s) (- n 1)))))

;
; Code provided in the exercise.
;
(define (merge s1 s2)
  (cond ((stream-empty? s1) s2)
        ((stream-empty? s2) s1)
        (else
         (let ((s1fst (stream-first s1))
               (s2fst (stream-first s2)))
           (cond ((< s1fst s2fst)
                  (stream-cons s1fst (merge (stream-rest s1) s2)))
                 ((> s1fst s2fst)
                  (stream-cons s2fst (merge s1 (stream-rest s2))))
                 (else
                  (stream-cons s1fst (merge (stream-rest s1) (stream-rest s2)))))))))
