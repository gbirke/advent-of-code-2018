#lang racket/base

(require rackunit
         "checksum.rkt")

(check-equal? (checksum '("bababc" "abbcde" "abcccd" "ababab")) 6 "Test checksum with 2*3")
(check-equal? (checksum '("bababc" "abbcde" "abcccd" "ababab" "abacab")) 12 "Test checksum with 3*4")

(check-equal? (checksum-parts (char-count 0 0) "") (char-count 0 0) "Empty string should not increase count")
(check-equal? (checksum-parts (char-count 0 0) "ab") (char-count 0 0) "non duplicate chars should not increase count")
(check-equal? (checksum-parts (char-count 0 0) "aa") (char-count 1 0) "double chars should increase double count by 1")
(check-equal? (checksum-parts (char-count 0 0) "aaa") (char-count 0 1) "triple chars should increase triple count by 1")
(check-equal? (checksum-parts (char-count 0 0) "aaabb") (char-count 1 1) "double and triple chars should increase double and triple count by 1")
(check-equal? (checksum-parts (char-count 0 0) "aaaaaa") (char-count 0 0) "multiple chars should not increase count")
(check-equal? (checksum-parts (char-count 0 0) "abcdef") (char-count 0 0) "multiple chars should not increase count")
(check-equal? (checksum-parts (char-count 0 0) "aabbccc") (char-count 1 1) "multiple double chars should only increase double count by 1")
(check-equal? (checksum-parts (char-count 0 0) "bababc") (char-count 1 1) "Example 2")
(check-equal? (checksum-parts (char-count 0 0) "abbcde") (char-count 1 0) "Example 3")
(check-equal? (checksum-parts (char-count 0 0) "abcccd") (char-count 0 1) "Example 4")
(check-equal? (checksum-parts (char-count 0 0) "ababab") (char-count 0 1) "Example 6")

(check-equal? (add-to-char-count (char-count 0 0) 0) (char-count 0 0) "0 should not update")
(check-equal? (add-to-char-count (char-count 0 0) 2) (char-count 1 0) "2 should update two")
(check-equal? (add-to-char-count (char-count 0 0) 3) (char-count 0 1) "3 should update three")
(check-equal? (add-to-char-count (char-count 0 0) 5) (char-count 1 1) "5 should update two and three")
(check-equal? (add-to-char-count (char-count 0 0) 1) (void) "other values should return void")


(check-equal? (count-chars "abcd") #hash((#\a . 1) (#\b . 1) (#\c . 1) (#\d . 1)) "should count characters")
(check-equal? (count-chars "abbcd") #hash((#\a . 1) (#\b . 2) (#\c . 1) (#\d . 1)) "should count characters")

(check-equal? (next-char-hash "a" #hash()) #hash(("a" . 1)) "Should create a hash")
(check-equal? (next-char-hash "a" #hash(("a" . 1)("b" . 1))) #hash(("a" . 2)("b" . 1)) "Should create an updated hash")
