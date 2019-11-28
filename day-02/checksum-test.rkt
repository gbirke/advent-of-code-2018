#lang racket/base

(require rackunit
         "checksum.rkt")

(check-equal? (checksum-parts (char-count 0 0) "") (char-count 0 0) "Empty string should not increase count")
(check-equal? (checksum-parts (char-count 0 0) "ab") (char-count 0 0) "non duplicate chars should not increase count")
; (check-equal? (checksum-parts (char-count 0 0) "aa") (char-count 1 0) "double chars should increase double count by 1")

;(check-equal (count-chars "abcd") #hash(("a" . 1) ("b" . 1) ("c" . 1) ("d" . 1)) "should count characters")

(check-equal? (next-char-hash "a" #hash()) #hash(("a" . 1)) "Should create a hash")
(check-equal? (next-char-hash "a" #hash(("a" . 1)("b" . 1))) #hash(("a" . 2)("b" . 1)) "Should create an updated hash")