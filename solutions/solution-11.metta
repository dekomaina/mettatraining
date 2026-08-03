(= (find-even $list) 
    (if (== 0 (size-atom $list))
        ()
        (let*
            (
                (($h $t) (decons-atom $list))
                ($rest (find-even $t))
            )
            (if (== 0 (% $h 2))
                (cons-atom $h $rest) ; include/pick
                $rest ; exclude/skip
            )
        )
    )
)

!(find-even (3 8 5 10 7 12)) ; (8 10 12)