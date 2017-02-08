#lang racket

; Exercise 4.60

; No, since the lives-near rule gets turned into other
; rules 'and'ed together. The first rule produces a stream
; of frames where each one has person-1 bound to a person
; that has an address associated with it. Then each one
; of those frames matches all people whose town matches the
; town value bound in that frame. So each person gets matched
; against all others.

; I suppose you could add a rule that the string value of
; person-1's name should be less than the string value of
; person-2's name.