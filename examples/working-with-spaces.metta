; ==========================================================
; WORKING WITH SPACES: PROJECT-LEVEL EXAMPLES
; ----------------------------------------------------------
; These examples use the relationship graph style from
; `metta-demo/src/data.metta` so students can practice
; space operations in the same domain as the course project.

(Friend Alice Bob)
(Friend Alice Carol)
(Friend Alice Emma)

(Family Alice David)
(Colleague Alice Helen)

(Profession Bob Nurse)
(Profession Carol Artist)
(Profession Emma Nurse)
(Profession David Artist)
(Profession Helen Lawyer)

(Hobby Bob Hiking)
(Hobby Carol Chess)
(Hobby Emma Cooking)
(Hobby David Gardening)
(Hobby Helen Reading)

; ----------------------------------------------------------
; 1. Query the current space with &self
; ----------------------------------------------------------

!(match &self (Friend Alice $x) $x)
!(match &self (Profession $x Nurse) $x)
!(match &self (, (Friend Alice $x) (Profession $x Nurse)) $x)

; ----------------------------------------------------------
; 2. Inspect the space state from Python if teaching live
; ----------------------------------------------------------
;
; print(list(metta.space().get_atoms()))

; ----------------------------------------------------------
; 3. Add atoms to the current space
; ----------------------------------------------------------

!(add-atom &self (Friend Alice Noah))
!(add-atom &self (Profession Noah Nurse))
!(match &self (, (Friend Alice $x) (Profession $x Nurse)) $x)

; ----------------------------------------------------------
; 4. Remove atoms from the current space
; ----------------------------------------------------------

!(remove-atom &self (Friend Alice Noah))
!(remove-atom &self (Profession Noah Nurse))
!(match &self (Friend Alice Noah) $x)

; ----------------------------------------------------------
; 5. Constrain the search space with multiple facts
; ----------------------------------------------------------

!(match &self (, (Family Alice $x) (Profession $x Artist)) $x)
!(match &self (, (Colleague Alice $x) (Hobby $x Reading)) $x)
;
; Add a new Colleague relationship for Alice and Helen
;
; Change Bob's hobby from Hiking to Playing Chess   
;
; Change the Alice's
;
; Go through Alice's Friends and whenever we find someone with hobby of Hiking, change their hobby to Reading
