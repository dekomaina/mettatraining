;; ----------------------------------------------------------
;; CHALLENGE 4: Family Tree Knowledge Base (KB)
;; ----------------------------------------------------------
;; DATA:
;; Use the following atoms as your ground truth:
;; (Male Chandler) (Female Monica) (Male John) (Female Pam)
;; (Parents (Monica Chandler) John) (Parent John Bob)
;;
;; TASK:
;; Write queries or functions using 'match' to retrieve 
;; specific relationships.
;;
;; GOALS:
;; 1. Get the Parents of John.
;; 2. Get the Mother of Pam.
;; 3. Get the Siblings of Pam (Hard: must share parents but not be Pam).
;; 4. Get all Predecessors of Bob (Recursive search).(Male Chandler)
(Female Monica)
(Male John)
(Female Pam)
(Parents (Monica Chandler) John)
(Parents (Monica Chandler) Pam)
(Parent John Bob)

; 1
;!(match &self (Parents $x John) $x) 

; 2
(= (mother $x)
    (let* (
        ($parents (match &self (Parents $z $x) $z))
        ($split (superpose $parents))
        
        )
        (match &self (Female $split) $split)
    )
)
;!(mother Pam)

; 3
(= (sibling $x)
    (let*( 
        ($sib (collapse (match &self (, (Parents $z $x) (Parents $z $y)) $y)))
        ($result (subtraction-atom $sib (collapse $x)))
        )
        $result
    )
)
;!(sibling Pam)

; 4
(= (parent-of $c $p) (match &self (Parent $p $c) $p))
(= (parent-of $c $p) (match &self (Parents ($x $y) $c) (superpose ($x $y))))


(= (predecessor $anc $c) (parent-of $c $anc))
(= (predecessor $anc $c) (let $mid (parent-of $c $mid) (predecessor $anc $mid)))
(= (predecessors $c) (collapse (predecessor $anc $c)))

!(predecessors Bob)
