;; ==========================================================
;; CHALLENGE 16: Recursive Graph Tracing
;; ----------------------------------------------------------
;; TASK:
;; Write a recursive function `family-nurses` that takes a
;; person $person and a depth $depth, follows only `Family`
;; links, and returns people whose profession is `Nurse`.
;;
;; APPROACH:
;; Base case: when depth is 1, check direct `Family`
;; connections only.
;; Recursive step: follow `Family` to the next person and
;; reduce depth by 1 until the base case is reached.
;;
;; SIGNATURE:
;; (= (family-nurses $person $depth) ( ... ))
;;
;; TEST CASES:
;; !(family-nurses Alice 1) ; Should return ()
;; !(family-nurses Alice 2) ; Should return Noah
