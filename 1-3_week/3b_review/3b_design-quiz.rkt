;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3b_design-quiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; Mouse-click on background to add spinning stars, mouse-click on MTS to start star again in new location

;; =================
;; Constants:
(define WIDTH 400)
(define HEIGHT 400)
(define SPIN 7)
(define MTS (empty-scene WIDTH HEIGHT))
(define GROWTH-RATE 2)
(define STAR (star-polygon 2 7 3 "solid" "darkred"))


;; =================
;; Data definitions:
(define-struct starr (x y spin))
;; Star is (make-star (Natural[0, WIDTH] Natural[0, HEIGHT] Natural))
;; interp. (make-star x y) is  a star with x-coord an y-coord on MTS
;;   (x, y) is the center of the star in screen pixel coordinance
;;   spin is the rate at which the star will rotate clockwise
(define S1 (make-starr 0 0 2)) ;; top left-hand corner
(define S2 (make-starr WIDTH HEIGHT 2)) ;; bottom right-hand corner
(define S3 (make-starr (/ WIDTH 2) (/ HEIGHT 2) 2)) ;; center

(define (fn-for-starr s)
  (... (starr-x    s)
       (starr-y    s)
       (starr-spin s)))

;; Template rules used:
;; - Compound: 3 fields

;; =================
;; Functions:

;; Starr -> Starr
;; start the world with (make-star 200 200)
;; 
(define (main s)
  (big-bang s                          ; Starr
            (on-tick   tock)           ; Starr -> Starr
            (to-draw   render)         ; Starr -> Image
            (on-mouse  handle-mouse))) ; Starr Integer Integer MouseEvent -> Star
            

;; Star -> Star
;; produce the next star size increased by GROWTH-RATE
(check-expect (tock (make-starr 0 0 0)) (make-starr 0 0 2))
(check-expect (tock (make-starr 200 200 6)) (make-starr 200 200 8))
;; (define (tock s) (make-starr 0 0 0))

;; <template taken from Starr data def>
(define (tock s)
  (make-starr (starr-x                   s)
              (starr-y                   s)
              (+ GROWTH-RATE (starr-spin s))))


;; Star -> Image
;; render image of star at appropriate location and of appropriate size
(check-expect (render (make-starr 0 0 2)) (place-image (rotate 2 (star-polygon 2 7 3 "solid" "darkred"))
                                                       0 0 MTS))                                                      
(check-expect (render (make-starr 200 200 40)) (place-image (rotate 40 (star-polygon 40 7 3 "solid" "darkred"))
                                                            200 200 MTS))
(check-expect (render (make-starr 200 200 400)) (place-image (rotate (modulo 400 360) (star-polygon 400 7 3 "solid" "darkred"))
                                                            200 200 MTS))
;; (define (render s) (star-polygon 0 7 3 "solid" "white"))

;; <template taken from Starr data def>
(define (render s)
  (place-image (rotate (modulo (starr-spin s) 360) (star-polygon (starr-spin s) 7 3 "solid" "darkred"))
                                                            (starr-x s)
                                                            (starr-y s)
                                                            MTS))


;; Starr Natural Natural MouseEvent -> Starr
(check-expect (handle-mouse (make-starr 0 0 0) 200 200 "button-down") (make-starr 200 200 0))
(check-expect (handle-mouse (make-starr 110 26 36) 150 300 "button-down") (make-starr 150 300 0))
(check-expect (handle-mouse (make-starr 10 20 64) 150 300 "button-up") (make-starr 10 20 64))

;; (define (handle-mouse s x y me) (make-starr 0 0 0)) ; stub

#; ; <template taken from htdw recipe>
(define (handle-mouse s x y me)
  (cond [(mouse=? me "button-down") (... s x y)]
        [else
         (... s x y)]))

(define (handle-mouse s x y me)
  (cond [(mouse=? me "button-down")
         (make-starr x y 0)]
        [else
         (make-starr (starr-x s) (starr-y s) (starr-spin s))]))
