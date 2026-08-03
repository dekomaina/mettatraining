; Count Valid Pending Tasks
;
; Problem: given $queue and $banned, where the first item in $queue is processing and the rest are pending,
; return the number of pending tasks that are not banned.
;
; Approach
;
; Extract pending tasks: (cdr-atom $queue).
;
; Remove banned tasks: (subtraction-atom $pending $banned).
;
; Return count: (size-atom $result).
;
; Function definition:
;
(= (count-valid-pending $queue $banned) 

)
!(count-valid-pending (Task1 Task2 Task3 Task4) (Task3)) 
; ;; Return -> 2
