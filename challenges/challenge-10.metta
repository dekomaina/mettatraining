;; ==========================================================
;; CHALLENGE 10: The "Grand Pipeline" (Composition)
;; ----------------------------------------------------------
;; Task:
;; In a single expression (by nesting your functions), do the following:
;;  a. Filter the list to keep only the odd numbers.
;;  b. Triple every value in the resulting list.
;;  c. Compute the total sum of the numbers in the list.
;; GOAL: 
;; Combine multiple HOFs to solve a multi-step data processing problem.
(= (odd-num $acc $list)
    (if (== (size-atom $list) 0)
        $acc
    (let ($head $tail) (decons-atom $list)
        (if (== (% $head 2) 1)
            (odd-num (cons-atom $head $acc) $tail)
            (odd-num $acc $tail)
        )
    )
    )
)

(= (triple $list)
    (collapse (* (superpose $list) 3))
)

(= (total $list)
    (if (== (size-atom $list) 0)
        0
        (let ($h $t) (decons-atom $list)
            (+ $h (total $t))
        )
    )
)

(=(grand-pipeline $list)
    (let*
        (($odds (odd-num () $list))
         ($tripled (triple $odds))
         ($total (total $tripled)))
    $total
    )
)

!(grand-pipeline (2 3 4 5 6 7 8 9 10))
