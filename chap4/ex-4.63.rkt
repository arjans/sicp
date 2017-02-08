#lang racket

; Exercise 4.63

(rule (grandson ?person-1 ?person-2)
      (and (son ?father ?person-2 )
           (son ?person-1 ?father)))

(rule (probable-son ?person-1 ?person2)
      (and (wife ?person-1 ?wife)
           (son ?wife ?person-2)))

