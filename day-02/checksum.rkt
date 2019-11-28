#lang racket

(struct char-count (two three) #:transparent )

(define (checksum-struct-for-list list)
  #f
  )

(define (checksum-parts input-str current-count)
  (define (list-contains-number list number)
    (if (member number list) 1 0)
  )

  (define char-multiples (hash-values (count-chars input-str)))

  (char-count
    (+ (char-count-two current-count) (list-contains-number char-multiples 2))
    (+ (char-count-three current-count) (list-contains-number char-multiples 3))
  )
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
  
(provide checksum-struct-for-list
         char-count
         checksum-parts
         count-chars
         next-char-hash
         )
