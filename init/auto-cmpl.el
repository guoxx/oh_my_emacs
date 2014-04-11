(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'c-mode-common-hook
          (lambda ()
            (progn
              (add-to-list 'company-backends 'company-gtags))))

(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "M-TAB") 'company-complete)))

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection))))
 '(company-scrollbar-fg
   ((t (:background "black"))))
 '(company-scrollbar-bg
   ((t (:background "darkgray")))))
