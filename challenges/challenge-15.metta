;; ==========================================================
;; CHALLENGE 15: The Missing Nurse Lead
;; ----------------------------------------------------------
;; STORY:
;; You are helping debug the `metta-demo` relationship graph for a
;; community support app. During a live review, someone claims:
;;
;;   "Alice should have one more Nurse in her direct network."
;;
;; But the current graph does not show that result.
;;
;; Your job is to investigate the current space, test the missing
;; lead, and then roll back your experiment cleanly.
;;
;; MISSION 1: Investigate the current graph
;; 1. Write a query that returns all of Alice's direct friends.
;; 2. Write a query that returns every Nurse in the space.
;; 3. Write a query that returns Alice's friends who are Nurses.
;;
;; MISSION 2: Test the missing lead
;; A teammate suggests the missing person is Noah.
;;
;; 4. Add a fact showing that Alice is friends with Noah.
;; 5. Add a fact showing that Noah is a Nurse.
;; 6. Re-run your nurse-connection query and confirm whether Noah
;;    now appears in the result.
;;
;; MISSION 3: Clean up the experiment
;; The Noah facts were only a test and should not stay in the main
;; project graph yet.
;;
;; 7. Remove the two Noah facts you added.
;; 8. Re-run the same nurse-connection query and confirm Noah is gone.
