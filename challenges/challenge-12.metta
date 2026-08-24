;; ==========================================================
;; CHALLENGE 12: Reverse a Given List (and Partial Reverse)
;; ----------------------------------------------------------
;; TASK:
;; Implement 'reverse-list' using recursion and
;; construction/deconstruction primitives.
;;
;; APPROACH:
;; Base case: empty list → ().
;; Recursive decomposition: push the head to the end of the
;; reversed tail until base case.
;;
;; SIGNATURE:
;; (= (reverse-list $list) ( ... ))
;;
;; TEST CASE:
;; !(reverse-list (A B C D)) ; Should return (D C B A)
(= (reverse-list $list)
    (reverse-list-helper $list ())
)

(= (reverse-list-helper $list $acc)
    (if (== (size-atom $list) 0)
        $acc
        (let*
            (
                (($head $tail) (decons-atom $list))
                ($new-acc (cons-atom $head $acc))
            )
            (reverse-list-helper $tail $new-acc)
        )
    )

)

!(reverse-list (A B C D))
