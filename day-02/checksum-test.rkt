#lang racket/base

(require rackunit
         "checksum.rkt")

(check-equal? (checksum-for-list (list "abcdef" "bababc" "abbcde" "abcccd" "aabcdd" "abcdee" "ababab")) 12 "Calculate checksum for realistic list")


(check-equal? (checksum-struct-for-list (list "bababc")) (char-count 1 1) "Calculate checksum struct list with one item")
(check-equal? (checksum-struct-for-list (list "abcdef" "bababc" "abbcde" "abcccd" "aabcdd" "abcdee" "ababab")) (char-count 4 3) "Calculate checksum struct for realistic list")

(check-equal? (checksum-parts "" (char-count 0 0)) (char-count 0 0) "Empty string should not increase count")
(check-equal? (checksum-parts "ab" (char-count 0 0)) (char-count 0 0) "non duplicate chars should not increase count")
(check-equal? (checksum-parts "aa" (char-count 0 0)) (char-count 1 0) "double chars should increase double count by 1")
(check-equal? (checksum-parts "aabb" (char-count 0 0)) (char-count 1 0) "twice double chars still only count as 1")
(check-equal? (checksum-parts "aaa" (char-count 0 0)) (char-count 0 1) "double chars should increase double count by 1")
(check-equal? (checksum-parts "ababa" (char-count 0 0)) (char-count 1 1) "counts double and triple chars even when mixed")

(check-equal? (count-chars "abcd") #hash((#\a . 1) (#\b . 1) (#\c . 1) (#\d . 1)) "should count characters")
(check-equal? (count-chars "abbcd") #hash((#\a . 1) (#\b . 2) (#\c . 1) (#\d . 1)) "should count characters")

(check-equal? (next-char-hash "a" #hash()) #hash(("a" . 1)) "Should create a hash")
(check-equal? (next-char-hash "a" #hash(("a" . 1)("b" . 1))) #hash(("a" . 2)("b" . 1)) "Should create an updated hash")

(printf "All tests done\n")
