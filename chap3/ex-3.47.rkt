#lang racket

;
; SICP Exercise 3.47
; Implement a semaphore two ways.
;

;
; SICP has set-car! and set-cdr! but Racket doesn't.
; This is the blog post describing the decision to take them out:
; http://blog.racket-lang.org/2007/11/getting-rid-of-set-car-and-set-cdr.html
;
(require scheme/mpair)

;
; (a) Using mutexes.
;
(define (make-semaphore n)
  (let ((the-mutex (make-mutex))
        (ps 0))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
             (if (and (the-mutex 'acquire) (< ps n))
                 (begin (set! ps (+ ps 1))
                        (the-mutex 'release))
                 (the-semaphore 'acquire)))
            ((eq? m 'release)
             (if (the-mutex 'acquire)
                 (begin (set! ps (- ps 1))
                        (the-mutex 'release))            
                 (the-semaphore 'release)))))
    the-semaphore))

;
; (b) Using atomic test-and-set!(s)
;
(define (make-semaphore-2 n)
  (let ((cell (mlist false))
        (ps 0))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
             (if (and (not (test-and-set! cell)) (< ps n))
                 (begin (set! ps (+ ps 1))
                        (clear! cell))
                 (the-semaphore 'acquire)))
            ((eq? m 'release)
             (if (not (test-and-set! cell))
                 (begin (set! ps (- ps 1))
                        (clear! cell))            
                 (the-semaphore 'release)))))
    the-semaphore))

;
; Code from the book.
;
(define (make-mutex)
  (let ((cell (mlist false)))
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cell)
                 (the-mutex 'acquire)
                 true))
            ((eq? m 'release) (clear! cell))))
    the-mutex))

(define (clear! cell)
  (set-mcar! cell false))

;
; test-and-set! is assumed to be atomic.
; Question: why is cell supposed to be a list of one element?
; Why not just a boolean value? Then could use set! rather than set-car!
;
(define (test-and-set! cell)
  (if (mcar cell)
      true
      (begin (set-mcar! cell true)
             false)))
