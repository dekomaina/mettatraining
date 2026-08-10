; ==========================================================
; RECURSION WARM-UP BEFORE getConnections
; ----------------------------------------------------------
; These examples use the same predicate names as
; `metta-demo/src/data.metta`, but keep the recursion much
; smaller than the final `getConnections` function.

(Friend Alice Bob)
(Friend Alice Carol)
(Friend Alice Emma)
(Friend David Emma)
(Friend Frank Grace)
(Friend Helen Ian)

(Family Alice David)
(Family Alice Liam)
(Family Bob Emma)
(Family Carol Karen)
(Family David Noah)

(Profession Bob Nurse)
(Profession Emma Nurse)
(Profession Grace Doctor)
(Profession Liam Doctor)
(Profession Noah Nurse)

; ----------------------------------------------------------
; 1. Recursive family chain
; ----------------------------------------------------------
; Idea:
; - Base case: when depth is 0, stop and return the current person.
; - Recursive step: follow Family one level deeper and reduce depth.

(= (family-chain $person $depth)
   (if (== $depth 0)
       $person
       (match &self
              (Family $person $next)
              (family-chain $next (- $depth 1)))))

!(family-chain Alice 1) ; David, Liam
!(family-chain Alice 2) ; Noah

; ----------------------------------------------------------
; 2. Recursive friend walk
; ----------------------------------------------------------
; Idea:
; - Base case: depth 0 returns the current person.
; - Recursive step: follow Friend and reduce depth.
; This is still simpler than getConnections because it only
; walks one relation and does not filter by a target attribute.

(= (friend-walk $person $depth)
   (if (== $depth 0)
       $person
       (match &self
              (Friend $person $next)
              (friend-walk $next (- $depth 1)))))

!(friend-walk Alice 1) ; Bob, Carol, Emma
!(friend-walk Alice 2) ; empty in this small subset

; ----------------------------------------------------------
; 3. Recursive friend walk with a profession check
; ----------------------------------------------------------
; Idea:
; - Base case: depth 1 checks direct friends only.
; - Recursive step: if no direct answer is enough, keep walking
;   along Friend with a smaller depth.

(= (friend-nurses $person $depth)
   (if (== $depth 1)
       (match &self
              (, (Friend $person $next) (Profession $next Nurse))
              $next)
       (match &self
              (Friend $person $next)
              (friend-nurses $next (- $depth 1)))))

!(friend-nurses Alice 1) ; Bob, Emma
!(friend-nurses Alice 2) ; empty with this mini graph, but still shows recursion
