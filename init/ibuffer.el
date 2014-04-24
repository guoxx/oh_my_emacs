(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("lua" (mode . lua-mode))
               ("c/c++" (or
                         (mode . c-mode)
                         (mode . cc-mode)))
               ("prog" ;; non C++ related stuff.
                (or
                 (mode . python-mode)
                 (mode . shell-script-mode)
                 (mode . scheme-mode)
                 ;; etc
                 ))
               ("notes" (or
                         (mode . markdown-mode)
                         (mode . org-mode)))
               ("elisp" (or
                         (mode . emacs-lisp-mode)))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ("helm & ido" (or
                              (name . "^\\*helm")
                              (name . "^\\*ido")))
               ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (progn
              (ibuffer-switch-to-saved-filter-groups "default"))))

(setq ibuffer-show-empty-filter-groups nil)

