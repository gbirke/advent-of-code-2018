#lang racket/base

(require rackunit
         "checksum.rkt")

(check-equal? (count-chars (char-count 0 0) "") (char-count 0 0) "Empty string should not increase count")