(add-to-list 'load-path "~/.emacs.d/packages/yin/")

(require 'yin-mode)

(add-to-list 'auto-mode-alist '("\\.yin$" . yin-mode))

(add-hook 'yin-mode-hook
  (lambda ()
    (paredit-mode 1)
    (paren-face-add-support yin-font-lock-keywords)
    (set-face-foreground 'paren-face "DimGray")
    (mapc (lambda (x) (put x 'yin-indent-function 1)) *binding-constructs*)))
