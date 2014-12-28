(require 'org-table)

(defun get-date () (cdr (assoc "SCHEDULED" (org-entry-properties))))

(defun line-func (c e d)
  (if (eq e nil) (reverse d)
    (line-func (+ c 1) (cdr e) (cons (string-to-number (org-table-get-field c)) d))))

(defun table-func ()
  (search-forward excercise)
  (let ((column (org-table-current-column)))
    (push
     (line-func (+ column 1) (cdr (gethash set sethash)) (list (get-date)))
     mylist)))

(defun make-table (workout excercise set)
  (let ((excercise excercise)
        (sethash (make-hash-table :test 'equal)))
    (puthash "singleset" '("Date" "15 Reps" "12 Reps" "8 Reps") sethash)
    (puthash "singleset2" '("Date" "15 Reps" "12 Reps" "8 Reps" "8 Reps") sethash)
    (puthash "singleset12" '("Date" "12 Reps" "10 Reps" "8 Reps") sethash)
    (puthash "singleset10" '("Date" "10 Reps" "10 Reps" "10 Reps") sethash)
    (puthash "singleset50" '("Date" "50 Reps" "50 Reps") sethash)
    (puthash "singleset15" '("Date" "15 Reps" "12 Reps") sethash)
    (puthash "singleset30s" '("Date" "30 Sec." "30 Sec.") sethash)
    (puthash "singleset30" '("Date" "30 Reps") sethash)
    (puthash "forceset" '("Date" "5 Reps" "5 Reps" "5 Reps" "5 Reps" "5 Reps") sethash)
    (puthash "progressiveset" '("Date" "15 Reps" "12 Reps" "8 Reps" "8 Reps" "12 Reps" "15 Reps") sethash)
    (setq mylist (list (gethash set sethash)))
    (push 'hline mylist)
    (org-map-entries 'table-func workout (list beast-org-file))
    (reverse mylist)))

(defun get-time ()
  (cdr (assoc "Time" (org-entry-properties))))

(defun process-run-entry ()
  (push (list (get-date) (get-time)) the-list))

(defun run-table ()
  (let ((the-list '(hline ("Date" "Time"))))
    (org-map-entries 'process-run-entry "+running" (list beast-org-file))
    (reverse the-list)))

