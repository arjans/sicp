#lang racket

; Exercise 2.39

(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (fold-right op init (cdr seq)))))

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))

(define (reverse-r s)
  (fold-right (lambda (x y) (append y (list x))) null s))

(define (reverse-l s)
  (fold-left (lambda (x y) (cons y x)) null s))

