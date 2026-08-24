
;; ==========================================================
;; CHALLENGE 7: The List Transformer (HOF)
;; ----------------------------------------------------------
;; TASK:
;; 1. Given a list of tempretures in celsius, write: 
;;    a. A converter function that converts celsius to fahrenheit.
;;    b. Use your map function to convert the tempreture list to fahrenheit.
;;
;; GOAL: 
;; Master the map pattern by applying logic to a custom data structure.
(= (converter $x)
    (+ (* 1.8 $x) 32)
)

(= (convert $list)
    (collapse (converter (superpose $list)))
)

!(
    (convert (0 20 37 100))
)
