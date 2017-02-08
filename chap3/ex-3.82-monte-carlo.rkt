#lang racket

; SICP Exercise 3.82
; Write a Monte Carlo function using infinite streams.

; How to make infinite series converge faster?

(require racket/stream)

(define (stream-take s n)
  (cond
    [(stream-empty? s) '()]
    [(= n 0) '()]
    [else (cons (stream-first s) (stream-take (stream-rest s) (- n 1)))]))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo experiment)
  (if (experiment)
      (stream-cons (cons 1 1) (stream-map (λ (p) (cons (+ 1 (car p)) (+ 1 (cdr p)))) (monte-carlo experiment)))
      (stream-cons (cons 0 1) (stream-map (λ (p) (cons (car p) (+ 1 (cdr p)))) (monte-carlo experiment)))))

(define (estimate-integral p x1 x2 y1 y2)
  (lambda ()
    (p (random-in-range x1 x2) (random-in-range y1 y2))))

(define (in-circle? radius)
  (define (square x) (* x x))
  (lambda (x y)
    (<= (+ (square x) (square y)) (square radius))))

(define (estimate-pi radius)
  (stream-map (λ (x) (* 4.0 (/ (car x) (cdr x))))
              (monte-carlo (estimate-integral (in-circle? radius)
                                              (- radius)
                                              radius
                                              (- radius)
                                              radius))))
