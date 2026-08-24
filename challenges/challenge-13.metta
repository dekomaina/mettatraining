;; ==========================================================
;; CHALLENGE 13: REVERSE-UNTIL (PARTIAL REVERSE)
;; ----------------------------------------------------------
;; Reverse elements from index 0 up to index N.
;; Keep the remaining elements unchanged.
;;
;; Example:
;;
;; (A B C D E), 2
;;
;; Index:       0 1 2 3 4
;;              A B C D E
;;
;; Result:
;;              C B A D E
;; ==========================================================


;; ==========================================================
;; 1. APPEND
;; ==========================================================
;; Append two lists together.

(= (append () $ys)
    $ys
)

(= (append (: $x $xs) $ys)
    (: $x (append $xs $ys))
)


;; ==========================================================
;; 2. REVERSE A LIST
;; ==========================================================
;; Helper function uses an accumulator.

(= (reverse-helper () $acc)
    $acc
)

(= (reverse-helper (: $x $xs) $acc)
    (reverse-helper
        $xs
        (: $x $acc)
    )
)


(= (my-reverse $list)
    (reverse-helper $list ())
)


;; ==========================================================
;; 3. TAKE FIRST N ELEMENTS
;; ==========================================================
;; take-n gets the first N elements from a list.
;;
;; Example:
;; take-n (A B C D E) 3
;; -> (A B C)
;;
;; We use numbers as the counter.


(= (take-n $list 0)
    ()
)

(= (take-n () $n)
    ()
)

(= (take-n (: $x $xs) $n)
    (: $x
       (take-n $xs (- $n 1))
    )
)


;; ==========================================================
;; 4. DROP FIRST N ELEMENTS
;; ==========================================================
;; drop-n removes the first N elements.
;;
;; Example:
;; drop-n (A B C D E) 3
;; -> (D E)


(= (drop-n $list 0)
    $list
)

(= (drop-n () $n)
    ()
)

(= (drop-n (: $x $xs) $n)
    (drop-n $xs (- $n 1))
)


;; ==========================================================
;; 5. REVERSE-UNTIL
;; ==========================================================
;;
;; Index N is INCLUDED.
;;
;; Therefore:
;;
;; reverse-Until (A B C D E) 2
;;
;; means reverse the first 3 elements:
;;
;; (A B C)
;;
;; and leave:
;;
;; (D E)
;;
;; unchanged.
;;
;; Result:
;;
;; (C B A D E)
;; ==========================================================


(= (reverse-Until $list $n)
    (append
        (my-reverse
            (take-n $list (+ $n 1))
        )
        (drop-n $list (+ $n 1))
    )
)


;; ==========================================================
;; 6. TEST CASE
;; ==========================================================

!(reverse-Until (A B C D E) 2)
