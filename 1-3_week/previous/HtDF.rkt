;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDF) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; htdf web page

;; signature
;; Number -> Number (function consumes a num and returns a num)

;; purpose (should be less than one line)
;; Produce 2 times the given number
(check-expect (double 3) 6) ;; step 2
(check-expect (double 4.2) (* 2 4.2)) ;; step 2 ;; step 3 (8.4 => (* 2 4.2)) elaborated

;; stub (has correct function name)
;;      (has correct number of parameters)
;;      (produces a dummy result)
;; (define (double n) 0) ;; this is the stub


;; Step 2. Examples (wrapped in check-expect)

;; Step 3. Inventory, - template and constants
;(define (double n) ;; this is the template
;  (... n)) ;; do something with n

(define (double n)
  (* 2 n))
