#lang racket

; Exercise 2.45

(define (split first second)
  (define (splitter painter n)
    (if (= n 0)
      painter
      (let ((smaller (splitter painter (- n 1))))
        (first painter (second smaller smaller))))))

