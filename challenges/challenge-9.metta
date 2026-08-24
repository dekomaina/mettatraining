;; ==========================================================
;; CHALLENGE 9: THE "TOTALIZER" (FOLDING)
;; ----------------------------------------------------------
;; TASK:
;; Given a shopping cart:
;; (10.5 5.0 25.99)
;;
;; 1. Use fold to calculate the total price.
;; 2. Find the maximum price using fold and a combiner.
;;
;; GOAL:
;; Understand how to collapse a list into one value.
;; ==========================================================


;; ==========================================================
;; 1. SHOPPING CART
;; ==========================================================

(= (cart)
    (10.5 5.0 25.99)
)


;; ==========================================================
;; 2. ADDITION COMBINER
;; ==========================================================
;; This function combines two prices by adding them.

(= (add $a $b)
    (+ $a $b)
)


;; ==========================================================
;; 3. MAXIMUM COMBINER
;; ==========================================================
;; Return the larger of two values.

(= (maximum $a $b)
    (if (> $a $b)
        $a
        $b
    )
)


;; ==========================================================
;; 4. FOLD FUNCTION
;; ==========================================================
;; Base case:
;; When the list is empty, return the accumulator.

(= (fold $function $acc ())
    $acc
)


;; Recursive case:
;; Combine the accumulator with the first element,
;; then continue with the remaining list.

(= (fold $function $acc ($head $tail))
    (fold
        $function
        ($function $acc $head)
        $tail
    )
)


;; ==========================================================
;; 5. CALCULATE TOTAL
;; ==========================================================

(= (total-price $list)
    (fold add 0 $list)
)


;; ==========================================================
;; 6. FIND MAXIMUM PRICE
;; ==========================================================

(= (max-price $list)
    (fold maximum 0 $list)
)


;; ==========================================================
;; 7. TEST THE CART
;; ==========================================================

!(cart)


;; ==========================================================
;; 8. CALCULATE TOTAL
;; ==========================================================

!(total-price (cart))


;; ==========================================================
;; 9. FIND MAXIMUM PRICE
;; ==========================================================

!(max-price (cart))
