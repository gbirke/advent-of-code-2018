#lang racket
; produce list from input
(define (process-line in processFn)
  (let ([line (read-line in)])
    (if (eof-object? line)
        '()
        (cons (processFn line) (process-line in processFn))
        )
    )
  )

(define (resulting-frequency)
  (apply + (process-line
            (open-input-file "input.txt")
            string->number)))

; 1st part of the puzzle:
; (resulting-frequency)


(define (check-frequency frequency-results current-frequency)
  (if (member current-frequency frequency-results) current-frequency (cons current-frequency frequency-results)
      ))

(define (current-frequency frequency-results frequency-changes)
  (cond
    [(and (null? frequency-results ) (null? frequency-changes)) 0]
    [(null? frequency-changes) (first frequency-results)]
    [(null? frequency-results) (first frequency-changes)]
    [else (+ (first frequency-changes) (first frequency-results))]
    )
  )

(define (find-first-repeating-frequency frequency-results frequency-changes)
  (cond
    [(null? frequency-changes) #f ]
    [(member (current-frequency frequency-results frequency-changes ) frequency-results) (current-frequency frequency-results frequency-changes ) ]
    [else (find-first-repeating-frequency (cons (current-frequency frequency-results frequency-changes ) frequency-results) (rest frequency-changes))]
    ))


(provide check-frequency
         current-frequency
         find-first-repeating-frequency)
