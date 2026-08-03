; defining the size function
(= (size $list)
    (if (== $list ())
        0 ; base case
        (+ 1 (size (cdr-atom $list))) ;recursive case
    )
)

!(size (1 2 3))

; std-lib alternative: size-atom
!(size-atom (1 2 3))

; defining index function
(= (index-helper $counter $idx $list)
    (if (== $list ())
        () ; base case
        (if (== $idx $counter) ; recursive case
            (car-atom $list)
            (index-helper (+ 1 $counter) $idx (cdr-atom $list))
        )
    )
)

(= (index $list $idx)
    (index-helper 0 $idx $list)
)

!(index (1 2 3 4) 2) ; [3]

;std-lib alternative: index-atom
!(index-atom (1 2 3 4) 2) ; [3]

; (double-list (1 2 3 4)) -> (2 4 6 8)

(= (double-list $list)
    (
        (if (== (size-atom $list) 0)
            () ;base case
            (let* 
                (
                    ;cons-atom a (b c) -> (a b c)
                    (($h $t) (decons-atom $list)) ; decons-atom: decons-atom (a b c) -> a (b c)
                    ($doubled (* 2 $h))
                    ($rest (double-list $t))
                )
                (cons-atom $doubled $rest)
            )
        )
    )
)

!(double-list (1 2 3 4)) ; (2 4 6 8)