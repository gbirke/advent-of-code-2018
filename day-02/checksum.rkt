#lang racket

(struct char-count (two three) #:transparent )

(define (checksum-parts current-count input-str)
  current-count
  )

(define (count-chars str)
  (foldl
     next-char-hash
     #hash()
     (string->list str)
   )
)

(define (next-char-hash current-char result-hash)
  (hash-set result-hash current-char (+ 1 (hash-ref result-hash current-char 0)))
  )
  
(provide char-count
         checksum-parts
         count-chars
         next-char-hash
         )