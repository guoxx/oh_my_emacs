(add-hook 'c-mode-common-hook '(lambda ()
                                 (progn
                                   (c-set-style "linux")
                                   (setq c-basic-offset 4))))

;; (add-hook 'prog-mode-hook '(lambda ()
;;                              (interactive)
;;                              (setq show-trailing-whitespace 1)))

(add-hook 'lua-mode-hook 'flycheck-mode)

(eval-after-load "which-func"
  '(progn
     (custom-set-faces '(which-func
                         (
                          (((class color) (min-colors 88) (background light))
                           :inherit font-lock-function-name-face)
                          (((class grayscale mono) (background dark))
                           :inherit font-lock-function-name-face)
                          (((class color) (background light))
                           :inherit font-lock-function-name-face)
                          (((class color) (min-colors 88) (background dark))
                           :foreground "#fcfeb3")
                          (((background dark))
                           :foreground "#fcfeb3")
                          (t
                           :foreground "LightSkyBlue"))))
     (set-face-attribute 'which-func nil :font "Source Code Pro-14:italic" :underline t)))
