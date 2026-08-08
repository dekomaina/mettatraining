(= (update-atom $space $old-atom $new-atom)
   (let $_ (remove-atom $space $old-atom) (add-atom $space $new-atom))
   )

(= (get-friends $space $person) (collapse (match $space (Friend $person $x) $x)))

(= (get-hobbies $space $person) (match $space (Hobby $person $hobby) $hobby))

(= (change-hobby $space $person $new-hobby) 
   (let* (
      ($hobby-relation (Hobby $person $new-hobby))
      ($old-hobby (get-hobbies $space $person))
      )
     (update-atom $space (Hobby $person $old-hobby) $hobby-relation)
     )
   )

(= (change-hobbies $space $friends $hobby) 
            (let $friend 
               (superpose $friends) 
               (change-hobby $space $friend $hobby)
               )
)
