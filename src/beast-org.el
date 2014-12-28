(require 'org-table)

(defun get-property (prop) (cdr (assoc prop (org-entry-properties))))
(defun get-date () (get-property "SCHEDULED"))
(defun get-time () (get-property "Time"))

(defun alist-get-value (key alist) (car (cdr (assoc key alist))))

(defun line-func (c e d)
  (if (eq e nil) (reverse d)
    (line-func (+ c 1) (cdr e) (cons (string-to-number (org-table-get-field c)) d))))

(defun table-func ()
  (search-forward excercise)
  (let ((column (org-table-current-column)))
    (push
     (line-func (+ column 1) (alist-get-value set setalist) (list (get-date)))
     mylist)))

(defun make-table (workout excercise set)
  (let ((setalist '(("singleset"    ("15 Reps" "12 Reps" "8 Reps")) 
		    ("singleset2"   ("15 Reps" "12 Reps" "8 Reps" "8 Reps"))
		    ("singleset12"  ("12 Reps" "10 Reps" "8 Reps"))
		    ("singleset10"  ("10 Reps" "10 Reps" "10 Reps"))
		    ("singleset50"  ("50 Reps" "50 Reps"))
		    ("singleset15"  ("15 Reps" "12 Reps"))
		    ("singleset30s" ("30 Sec." "30 Sec."))		   
		    ("singleset30"  ("30 Reps"))
		    ("forceset"     ("5 Reps" "5 Reps" "5 Reps" "5 Reps" "5 Reps"))
		    ("progressiveset" ("15 Reps" "12 Reps" "8 Reps" "8 Reps" "12 Reps" "15 Reps")))))
    (setq mylist (list (cons "Date" (alist-get-value set setalist))))
    (push 'hline mylist)
    (org-map-entries 'table-func workout (list beast-org-file))
    (reverse mylist)))

(defun process-run-entry ()
  (push (list (get-date) (get-time)) the-list))

(defun run-table ()
  (let ((the-list '(hline ("Date" "Time"))))
    (org-map-entries 'process-run-entry "+running" (list beast-org-file))
    (reverse the-list)))
