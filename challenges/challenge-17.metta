;; ==========================================================
;; CHALLENGE 17: Direct Match Names
;; ----------------------------------------------------------
;; TASK:
;; Write `direct-match-names` that takes a list of pairs of tuples of names
;; names and depths, keeps only
;; depth-1 entries, and returns the corresponding names.
;;
;; Hint:
;;  - apply filter first on the list of pairs
;;  - map a function over the results
;; SIGNATURE:
;; (= (direct-match-names $list-of-pairs) ( ... ))
;;
;; TEST CASES:
; !(direct-match-names ((Bob 1) (Emma 2) (Helen 1)) ) ; Should return (Bob Helen)
; !(direct-match-names ((Karen 2) (Noah 2) (Liam 1)) ) ; Should return (Liam)
