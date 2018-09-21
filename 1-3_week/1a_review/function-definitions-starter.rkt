;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname function-definitions-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; function-definitions-starter.rkt

;(above (circle 40 "solid" "red")         
;       (circle 40 "solid" "yellow")
;       (circle 40 "solid" "green"))


(define (bulb c)
  (circle 40 "solid" c))

(above (bulb "red")
       (bulb "yellow")
       (bulb "green"))

;; bool intro

(define WIDTH 100)
(define HEIGHT 100)

(> WIDTH HEIGHT) ; false
(>= WIDTH HEIGHT) ; true

(string=? "foo" "bar") ; false

(define RECT1 (rectangle 10 20 "solid" "red"))
(define RECT2 (rectangle 20 10 "outline" "blue"))

(< (image-width RECT1)
   (image-width RECT2)) ; true
(= (image-height RECT1)
   (image-width RECT2)) ; true

;; if expressions

(if (< (image-width RECT1)
       (image-height RECT1))
    "tall"
    "wide")

(and (< (image-width RECT1)
   (image-width RECT2)) ; true
   (= (image-height RECT1)
   (image-width RECT2))) ; true

(or (< (image-width RECT1)
   (image-width RECT2)) ; true
   (= (image-height RECT1)
   (image-width RECT2))) ; true

(not (and (< (image-width RECT1)
             (image-width RECT2)) ; true
          (= (image-height RECT1)
             (image-width RECT2)))) ; true

