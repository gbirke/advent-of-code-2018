#lang racket/base

(require rackunit
         racket/trace
         "solution.rkt")


(check-equal? (check-frequency '(1 2 3) 1) 1 "Frequency in list")
(check-equal? (check-frequency '(1 2 3) 5) '(5 1 2 3) "Frequency not in list")

(check-equal? (current-frequency '() '()) 0 "Degenerate case")
(check-equal? (current-frequency '(5) '()) 5 "Returns last frequency when frequency change list is empty")
(check-equal? (current-frequency '() '(7)) 7 "Returns first frequency change when frequency list is empty")
(check-equal? (current-frequency '(5 1 3) '(7 9 4)) 12 "Adds heads of lists")


(check-equal? (find-first-repeating-frequency '() '()) #f "Degenerate case")
(check-equal? (find-first-repeating-frequency '(0) '(1 -1)) 0 "First example")
(check-equal? (find-first-repeating-frequency '(0) '(3 3 4 -2 -4)) 10 "Second example")