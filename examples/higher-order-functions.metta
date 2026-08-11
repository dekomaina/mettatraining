; ==========================================================
; HIGHER-ORDER FUNCTIONS
; ----------------------------------------------------------
; This lesson packet focuses on three core patterns:
; - map: transform every item
; - filter: keep only matching items
; - fold: reduce a list into one value

; ----------------------------------------------------------
; Helper functions
; ----------------------------------------------------------

(= (double $x) (* 2 $x))

(= (isEven $x) (== (% $x 2) 0))

(= (sum-step $acc $x) (+ $acc $x))

(= (tag-match $name) ($name found))

(= (is-direct-depth $depth) (== $depth 1))

; ----------------------------------------------------------
; map
; ----------------------------------------------------------

(= (map $fn $list)
   (if (== $list ())
     ()
     (let*(
           (($h $t) (decons-atom $list))
           ($h' ($fn $h))
           ($rest (map $fn $t))
           )
       (cons-atom $h' $rest)
       )
     )
   )

!(map double (1 2 3 4)) ; (2 4 6 8)
!(map tag-match (Bob Emma Helen)) ; ((Bob found) (Emma found) (Helen found))

; ----------------------------------------------------------
; filter
; ----------------------------------------------------------

(= (filter $pred $list)
   (if (== $list ())
     ()
     (let* (
            (($h $t) (decons-atom $list))
            ($rest (filter $pred $t))
            )
       (if ($pred $h)
         (cons-atom $h $rest)
         $rest
         )
       )
     )
   )
!(filter isEven (1 2 3 4 5 6)) ; (2 4 6)
!(filter is-direct-depth (1 2 1 3 1)) ; (1 1 1)

; ----------------------------------------------------------
; fold
; ----------------------------------------------------------

(= (fold $fn $acc $list)
   (if (== $list ())
     $acc
     (let* (
            (($h $t) (decons-atom $list))
            ($acc' ($fn $acc $h))
            )
       (fold $fn $acc' $t)
       )
     )
   )
!(fold sum-step 0 (1 2 3 4)) ; 10

; ----------------------------------------------------------
; example
; ----------------------------------------------------------
; Imagine these are query-result depths returned by a search:
; (1 2 1 3 2)
;
; - filter keeps only direct matches
; - fold counts or sums values

!(filter is-direct-depth (1 2 1 3 2)) ; (1 1)
!(fold sum-step 0 (1 2 1 3 2)) ; 9
