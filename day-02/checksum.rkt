#lang racket

(struct char-count (two three) #:transparent )

(define (checksum strings)
  (define (checksum-parts-fold input-str current-count)
	(checksum-parts current-count input-str))
  (let ([checksum-count (foldl checksum-parts-fold (char-count 0 0) strings)])
	(* (char-count-two checksum-count) (char-count-three checksum-count))
  )
)

(define (checksum-parts current-count input-str)
  (define (is-checksum-number n)
    (or (= n 2) (= n 3)))

  (add-to-char-count current-count (apply + (remove-duplicates (filter is-checksum-number (hash-values (count-chars input-str))))))
  
)

(define (add-to-char-count input-count checksum-id)
  (cond
	[(= checksum-id 0) input-count]
	[(= checksum-id 2) (char-count (+ 1 (char-count-two input-count)) (char-count-three input-count))]
	[(= checksum-id 3) (char-count (char-count-two input-count) (+ 1 (char-count-three input-count)))]
	[(= checksum-id 5) (char-count (+ 1 (char-count-two input-count)) (+ 1 (char-count-three input-count)))]
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
  
(provide char-count
		 checksum
         checksum-parts
         count-chars
         next-char-hash
		 add-to-char-count
         )
