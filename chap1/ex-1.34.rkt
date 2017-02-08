#lang racket

; Exercise 1.34

(f f)

((lambda (g) (g 2)) f)

(f 2)

((lambda (g) (g 2)) 2)

(2 2)

"Not a procedure"
