(add-to-list 'load-path "~/.emacs.d/")
(require 'package)
(package-initialize)

(require 'org-table)
(require 'ess-site) 

(org-babel-do-load-languages 'org-babel-load-languages '((R . t)))

(setq org-confirm-babel-evaluate nil)


