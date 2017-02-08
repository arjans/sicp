#lang racket

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (estimate-integral p x1 x2 y1 y2)
  (lambda ()
    (p (random-in-range x1 x2) (random-in-range y1 y2))))

(define (in-circle? radius)
  (define (square x) (* x x))
  (lambda (x y)
    (<= (+ (square x) (square y)) (square radius))))

(define (estimate-pi radius trials)
  (* 4.0 (monte-carlo trials
                    (estimate-integral (in-circle? radius)
                                       (- radius)
                                       radius
                                       (- radius)
                                       radius))))
