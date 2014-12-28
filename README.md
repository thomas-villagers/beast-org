			      ━━━━━━━━━━━
			       BEAST-ORG


				 thomas
			      ━━━━━━━━━━━


Table of Contents
─────────────────

1 Body Beast meets Org-Mode
.. 1.1 Capture Templates
.. 1.2 Emacs-Lisp
.. 1.3 R
.. 1.4 Batch Export

1 Body Beast meets Org-Mode
═══════════════════════════

  Capture [Body Beast] workout results and statistics

  see [example]


  [Body Beast]
  http://www.beachbody.com/product/fitness_programs/body-beast-workout.do

  [example] file:training.html


1.1 Capture Templates
─────────────────────


1.2 Emacs-Lisp
──────────────

  see [beast-org.el]


  [beast-org.el] file:src/beast-org.el


1.3 R
─────

  R needs zoo, ggplot2 and reshape2

  ┌────
  │ install.packages("zoo")
  │ install.packages("ggplot2")
  │ install.packages("reshape")
  └────


1.4 Batch Export
────────────────

  ┌────
  │ emacs -l init.el training.org --batch -f org-html-export-to-html --kill
  └────
