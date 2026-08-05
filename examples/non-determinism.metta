(Friend Alice Bob) ; Alice is a friend of Bob
(Friend Alice Carol)
(Friend Alice Emma)
(Friend David Emma)
(Friend Frank Grace)
(Friend Helen Ian)

(Colleague Bob Carol)
(Colleague Alice Helen)
(Colleague Carol David)
(Colleague Emma Frank)
(Colleague Grace Helen)
(Colleague Ian Jack)

(Family Alice David)
(Family Alice Liam)
(Family Bob Emma)
(Family Carol Karen)
(Family Grace Helen)
(Family Jack Karen)
(Family David Noah)

(Neighbor David Grace)
(Neighbor Emma Ian)
(Neighbor Frank Jack)
(Neighbor Helen Liam) 
(Neighbor Karen Mike)
(Neighbor Tedi Yeab)

(Classmate Alice Angela)
(Classmate Helen tedi)
(Classmate Bob Ian)
(Classmate Carol Jack)
(Classmate David Liam)
(Classmate Emma Mike)

(Profession Alice Engineer)
(Profession Bob Nurse)
(Profession Helen Nurse)
(Profession David Artist)
(Profession Emma Nurse)    
(Profession Frank Engineer)
(Profession Grace Doctor)
(Profession Helen Lawyer)
(Profession Ian Scientist)
(Profession Jack Pilot)
(Profession Karen Nurse)   
(Profession Liam Doctor)
(Profession Mike Teacher)
(Profession Noah Nurse)    
(Profession Olivia Scientist)
(Profession yeab Nurse)    


(Hobby Alice Painting)
(Hobby Bob Hiking)
(Hobby Carol Chess)
(Hobby David Gardening)
(Hobby Emma Cooking)
(Hobby Frank Cycling)
(Hobby Grace Swimming)
(Hobby Helen Reading)
(Hobby Ian Photography)
(Hobby Jack Running)
(Hobby Karen Dancing)
(Hobby Liam Gaming)
(Hobby Mike Singing)
(Hobby Noah Coding)
(Hobby Olivia Traveling)

(= (echo $x) (The friend of Alice who is a Nurse is $x))

; (RelationshipType participants ...)
!(match &self (Profession $x Nurse) $x) ; get people with Nursing as their profession
!(match &self (Friend Alice $x) $x); Alice's friends
!(match &self (Hobby $x $y) ($x $y)); search for people with hobbies

!(match &self (Friend Alice $x) (match &self (Profession $x Nurse) $x)) ; people who are alice's friends and Nurses
!(let $output (
                collapse 
                    (match &self (, (Friend Alice $x) (Profession $x Nurse)) 
                    $x
                    )
                )
        (echo $output)
        )

(= (add $value $inc) (+ $value $inc))
(= (sum $list) (
        (if (== $list ())
            0
            (let ($h $t) (decons-atom $list) (+ $h (sum $t)))
        )
    )
)

; !(sum (1 2 3))
!(let $list (1 2 3 4) (sum (collapse (add (superpose $list) 10)))) ; a list [1, 2,  3, 4]
; [1,2,3,4]
; add [1,2,3,4] 10 -> [(add 1, 10), (add 2, 10), (add 3, 10), (add 4, 10)]
;                     [(+ 1 10), (+ 2 10) ... (+ 4 10)]
;                     [11, 12, 13, 14]

; 1. Try to write a match expression that finds Alice's Friends who are Artists.
!(match &self (, 
                (Friend Alice $x)
                (Profession $x Artist)
            )
            $x
            )

; 2. Try to write a match query that finds classmates of Carol who like running.
!(match &self (, 
                (Classmate Carol $x)
                (Hobby $x Running)
                )
                $x
                )

