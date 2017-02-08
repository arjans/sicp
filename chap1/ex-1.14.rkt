#lang racket

; Exercise 1.14

; Steps increase as Θ(n^5).
; With 0 denominations, you have Θ(1).
; With 1 denomination (just pennies), you have Θ(n).
; With 2 denominations, you have many Θ(n) processes created n/5 times. So, roughly Θ(n^2).
; Extrapolating to 5 denominations, you get Θ(n^5).
; Growth of space? To me it looks the same as steps.
