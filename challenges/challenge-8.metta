;; ==========================================================
;; CHALLENGE 8: THE RANGE GUARD
;; ----------------------------------------------------------
;; TASK:
;; Given a list of ages: (12 25 17 40)
;;
;; 1. Write predicate (is-adult age) returning True
;;    if age >= 18
;;
;; 2. Use filter to produce a list containing
;;    only adults
;;
;; 3. Write (is-teen age) and filter for ages 13-19
;;
;; GOAL:
;; Use predicates to filter data based on boundaries.
;; ==========================================================


;; ==========================================================
;; 1. DATA
;; ==========================================================

(= (ages)
    (12 25 17 40)
)


;; ==========================================================
;; 2. ADULT PREDICATE
;; ==========================================================
;; An adult is someone whose age is >= 18.

(= (is-adult $age)
    (if (>= $age 18)
        True
        False
    )
)


;; ==========================================================
;; 3. FILTER ADULTS
;; ==========================================================
;; Keep only ages for which is-adult returns True.

(= (adult-filter $list)
    (collapse
        (if
            (is-adult (superpose $list))
            (superpose $list)
            ()
        )
    )
)


;; ==========================================================
;; 4. TEEN PREDICATE
;; ==========================================================
;; A teenager is between 13 and 19 inclusive.

(= (is-teen $age)
    (if
        (and
            (>= $age 13)
            (<= $age 19)
        )
        True
        False
    )
)


;; ==========================================================
;; 5. FILTER TEENAGERS
;; ==========================================================

(= (teen-filter $list)
    (collapse
        (if
            (is-teen (superpose $list))
            (superpose $list)
            ()
        )
    )
)


;; ==========================================================
;; 6. TEST is-adult
;; ==========================================================

!(is-adult 12)

!(is-adult 17)

!(is-adult 18)

!(is-adult 25)

!(is-adult 40)


;; ==========================================================
;; 7. TEST is-teen
;; ==========================================================

!(is-teen 12)

!(is-teen 13)

!(is-teen 17)

!(is-teen 19)

!(is-teen 20)


;; ==========================================================
;; 8. FILTER ADULTS
;; ==========================================================

!(adult-filter (ages))


;; ==========================================================
;; 9. FILTER TEENAGERS
;; ==========================================================

!(teen-filter (ages))
