
; Create and Import Modules
;;;; register-module! -> Tells MeTTa where the module's folder lives.
;;;; import! -> Brings the module into the execution space.

!(register-module! ./utils_module)
!(import! &self utils_module:helpers)

; ==========================================================
; WORKING WITH SPACES: PROJECT-LEVEL EXAMPLES
; ----------------------------------------------------------
; These examples use the relationship graph style from
; `metta-demo/src/data.metta` so students can practice
; space operations in the same domain as the course project.

; friendships
(Friend Alice Bob)
(Friend Alice Carol)
(Friend Alice Emma)

; family
(Family Alice David)

; colleague
(Colleague Alice Helen)

; profession
(Profession Bob Nurse)
(Profession Carol Artist)
(Profession Emma Nurse)
(Profession David Artist)
(Profession Helen Lawyer)

; hobbies
(Hobby Bob Hiking)
(Hobby Carol Chess)
(Hobby Emma Cooking)
(Hobby David Gardening)
(Hobby Helen Reading)

; ----------------------------------------------------------
; 1. Query the current space with &self
; ----------------------------------------------------------

; !(match &self (Friend Alice $x) $x)
; !(match &self (Profession $x Nurse) $x)
; !(match &self (, (Friend Alice $x) (Profession $x Nurse)) $x)

; functions 
; ----------------------------------------------------------
; 2. Add atoms to the current space
; ----------------------------------------------------------

; !(add-atom $space $atom) -> symbol [bob, alice ...], expression [(bob emma)]
; !(add-atom &self (Friend Alice Noah))
; !(add-atom &self (Profession Noah Nurse))
; !(match &self (, (Friend Alice $x) (Profession $x Nurse)) $x)

; ----------------------------------------------------------
; 4. Remove atoms from the current space
; ----------------------------------------------------------

; !(remove-atom &self (Friend Alice Noah))
; !(remove-atom &self (Profession Noah Nurse))
; !(match &self (Friend Alice Noah) (Found))

; ; ----------------------------------------------------------
; ; 5. Constrain the search space with multiple facts
; ; ----------------------------------------------------------

; !(match &self (, (Family Alice $x) (Profession $x Artist)) $x)
; !(match &self (, (Colleague Alice $x) (Hobby $x Reading)) $x)

; bind! -> define new spaces
; new-space -> creates a new space with a name we pass it
; !(bind! &customSpace (new-space))
; !(add-atom &customSpace (Friend Alice Noah))
; !(add-atom &customSpace (Friend Alice Bob))
; !(add-atom &customSpace (Friend Alice Emma))
; !(match &customSpace (Friend Alice $x) $x)
; !(remove-atom &customSpace (Friend Alice Noah))
; !(match &customSpace (Friend Alice $x) $x)

; get-atoms
; !(get-atoms &customSpace)


; !(get-friends &self Alice)
; Exercise
; Add a new Colleague relationship for Alice and Helen
; !(add-atom &self (Colleague Alice Helen))

; Change Bob's hobby from Hiking to Playing Chess   
; !(update-atom &self (Hobby Bob Hiking) (Hobby Bob Chess))

; Go through Alice's Friends and change everyone's hobbies into None
;; in two ways: recurssively, using superpose(non-determinism)
; (= (changeHobby $space $friends)
;     (if (== $friends ())
;         ()
;         (let* (
;             (($h $t) (decons-atom $friends))
;             ($_ (changeHobby $space $t))
;         )
;         (let $_ (remove-atom $space (Hobby $h $hobby)) (add-atom $space (Hobby $h None)))
;         )
;     )
; )
; !(let $friends (get-friends &self Alice) (changeHobby &self $friends))
; !(match &self (, (Friend Alice $x) (Hobby $x $hobby)) $hobby) ; None, None, ... 
; !(change-hobby &self Bob Chess)
; !(get-hobbies &self Bob)
!(let $friends (get-friends &self Alice) (change-hobbies &self $friends Cycling))
!(get-hobbies &self Bob)
; Go through Alice's Friends and whenever we find someone with hobby of Hiking, change their hobby to Reading