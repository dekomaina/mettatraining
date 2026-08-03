; Find Even Elements

; Task: Write a function find-even that takes a list of numbers $list and returns a new list containing only the even numbers.
;
; Approach
;
; Base case: empty list → ().
;
; Recursive step: check car for evenness; 
;
;         if even, cons it onto recursive result; otherwise skip.
;
; Function 
;
(= (find-even $list) 

)
;
; Example: !(find-even (3 8 5 10 7 12))
; ;; Result -> (8 10 12)
