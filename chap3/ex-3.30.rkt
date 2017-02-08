#lang racket

(define (ripple-carry-adder as bs ss c)
  (let ((c-in (make-wire)))
    (full-adder (car as) (car bs) c-in (car s) c)
    (if (null? (cdr as))
        (set-signal! c-in 0)
        (ripple-carry-adder (cdr as) (cdr bs) (cdr ss) c-in))))
