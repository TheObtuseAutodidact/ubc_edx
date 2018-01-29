# Quick Run Through: HtDF Recipe
design recipes link

Design a function that takes a number and doubles that number.

## Step 1. Signature, purpose, and stub


;; Number -> Number
;; produce 2 times the given number

> (define (double n) 0) ; this s the stub

## Step 2. Examples (wrapped in check-expect)

> (check-expect (double 3) 6)
> (check-expect (double 4.2) (2 * 4.2)) ;; modify in step 4 to elaborate problem definition
;; Run the test!

## Step 3. Inventory Template & constants

> (define (double n) ;; this is the template
> (... n))

## Step 4. Code body

> (define (double n) ;; this is the template
> (* 2 n))
