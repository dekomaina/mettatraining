
;; ============================================================
;; CHALLENGE 3: The Digit Counter - Daniel's Solution
;; ============================================================

;; Main function: count-digits
;; Counts digits in a number using accumulator pattern
(= (count-digits $number $count)
   (if (== $number 0)
       (if (== $count 0) 
           1              ; Special case: the number 0 has 1 digit
           $count)        ; Otherwise return accumulated count
       (count-digits (/ $number 10) (+ $count 1))))

;; Tests
!(count-digits 90721 0)    ; Expected: 5
!(count-digits 123 0)      ; Expected: 3
!(count-digits 0 0)        ; Expected: 1
