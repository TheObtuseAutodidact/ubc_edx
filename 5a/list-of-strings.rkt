;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname list-of-string-data-def) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Constants
(define BLANK (square 0 "solid" "white"))
(define TEXT-SIZE 24)
(define TEXT-COLOR "black")

;; ListOfString is one of:
;; - empty
;; - compound: (cons String ListOfString)
;; interp. a list of strings

(define LOS0 empty)
(define LOS1 (cons "a" empty))
(define LOS2 (cons "abc" (cons "def" empty)))

(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (first los)
              (fn-for-los(rest los)))]))

;; Template rules used:
;; One of two cases:
;; atomic-distinct: empty
;; compound: (cons String ListOfString)
;; self-reference: (rest los) is ListOfString

;; ListOfString -> ListOfString
;; consume ListOfString and produce a Images of Strings sorted in alphabetical order

(check-expect (arrange-strings (cons "Sally" (cons "Apple" empty)))
              (above/align "left"
                           (text "Apple" TEXT-SIZE TEXT-COLOR)
                           (text "Sally" TEXT-SIZE TEXT-COLOR)
                           BLANK))

;; (define (arrange-strings los) BLANK)
(define (arrange-strings los)
  (present-strings(sort-strings los)))

;; ListOfString -> ListOfString
;; consume a ListOfString and return that list sorted in alphabetical order
(check-expect (sort-strings empty) empty)
(check-expect (sort-strings (cons "Apple" (cons "Banana" (cons "Cherry" empty))))
              (cons "Apple" (cons "Banana" (cons "Cherry" empty))))
(check-expect (sort-strings (cons "Apple" (cons "Cherry" (cons "Banana" empty))))
              (cons "Apple" (cons "Banana" (cons "Cherry" empty))))
(check-expect (sort-strings (cons "Banana" (cons "Apple" (cons "Cherry" empty))))
              (cons "Apple" (cons "Banana" (cons "Cherry" empty))))
(check-expect (sort-strings (cons "Banana" (cons "Cherry" (cons "Apple" empty))))
              (cons "Apple" (cons "Banana" (cons "Cherry" empty))))
(check-expect (sort-strings (cons "Cherry" (cons "Apple" (cons "Banana" empty))))
              (cons "Apple" (cons "Banana" (cons "Cherry" empty))))
(check-expect (sort-strings (cons "Cherry" (cons "Banana" (cons "Apple" empty))))
              (cons "Apple" (cons "Banana" (cons "Cherry" empty))))

;; (define (sort-strings los) los)
;; <template taken from ListOfString data def>
(define (sort-strings los)
  (cond [(empty? los) empty]
        [else
         (insert-string (first los)
                        (sort-strings (rest los)))]))

;; String ListOfString -> ListOfString
;; places string into listofstring in alphabetical order
(check-expect (insert-string "Apple" empty) (cons "Apple" empty))
(check-expect (insert-string"Apple" (cons "Banana" (cons "Cherry" empty)))
              (cons "Apple" (cons "Banana" (cons "Cherry" empty))))
(check-expect (insert-string "Banana" (cons "Apple" (cons "Cherry" empty)))
              (cons "Apple" (cons "Banana" (cons "Cherry" empty))))
(check-expect (insert-string "Cherry" (cons "Apple" (cons "Banana" empty)))
              (cons "Apple" (cons "Banana" (cons "Cherry" empty))))

;; (define (insert-string str los) los) ; stub
;; <template taken from ListOfString data def>
(define (insert-string str los)
  (cond [(empty? los) (cons str empty)]
        [else
         (if (string>=? str (first los))
             (cons (first los) (insert-string str (rest los)))
             (cons str los))]))


;; ListOfString -> Image
;; consume ListOfString and present Strings as Images
(check-expect (present-strings empty) BLANK)
(check-expect (present-strings (cons "Apple" empty))
              (above/align "left"
                           (text "Apple" TEXT-SIZE TEXT-COLOR)
                           BLANK))
(check-expect (present-strings (cons "Apple" (cons "Banana" (cons "Cherry" empty))))
              (above/align "left"
                           (text "Apple" TEXT-SIZE TEXT-COLOR)
                           (text "Banana" TEXT-SIZE TEXT-COLOR)
                           (text "Cherry" TEXT-SIZE TEXT-COLOR)
                           BLANK))

;; (define (present-strings los) BLANK) ; stub
;; <template taken from ListOfString data def>

(define (present-strings los)
  (cond [(empty? los) BLANK]
        [else
         (above/align "left"
                      (text (first los) TEXT-SIZE TEXT-COLOR)
                      (present-strings (rest los)))]))