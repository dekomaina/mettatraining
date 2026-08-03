(= (reverse-list-helper $acc $list)
    (if (== () $list)
        $acc
        (let*
            (
                (($h $t) (decons-atom $list))
                ($newList (cons-atom $h $acc))
            )
            (reverse-list-helper $newList $t)
        )
    )
)

(= (reverse-list $list) (reverse-list-helper () $list) )
!(reverse-list (A B C D)) ; Should return (D C B A)