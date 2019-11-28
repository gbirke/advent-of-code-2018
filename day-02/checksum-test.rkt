#lang racket/base

(require rackunit
         "checksum.rkt")

(check-equal? (count-chars (char-count 0 0) "") (char-count 0 0) "Empty string should not increase count")
(check-equal? (count-chars (char-count 0 0) "ab") (char-count 0 0) "non duplicate chars should not increase count")
(check-equal? (count-chars (char-count 0 0) "aa") (char-count 1 0) "double chars should increase double count by 1")
