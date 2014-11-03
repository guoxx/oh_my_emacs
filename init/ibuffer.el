(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("lua" (mode . lua-mode))
               ("c/c++" (or
                         (mode . c-mode)
                         (mode . cc-mode)
                         (mode . c++-mode)))
               ("prog" ;; non C++ related stuff.
                (or
                 (mode . python-mode)
                 (mode . shell-script-mode)
                 (mode . sh-mode)
                 (mode . scheme-mode)
                 (mode . yin-mode)
                 (mode . makefile-mode)
                 (mode . java-mode)
                 (mode . ruby-mode)
                 ;; etc
                 ))
               ("notes" (or
                         (mode . markdown-mode)
                         (mode . org-mode)
                         (mode . text-mode)))
               ("elisp" (or
                         (mode . emacs-lisp-mode)))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ("misc" (or
                              (name . "^\\*helm")
                              (name . "^\\*ido")))
               ))))

(setq ibuffer-formats
      '((mark modified read-only " "
              (name 32 32 :left :elide) " "
              (size 9 -1 :right) " "
              (mode 16 16 :left :elide) " " filename-and-process)
        (mark " " (name 16 -1) " " filename)))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (progn
              (ibuffer-switch-to-saved-filter-groups "default"))))

(setq ibuffer-show-empty-filter-groups nil)

