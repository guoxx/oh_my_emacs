(add-to-list 'load-path "~/.emacs.d/packages/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/packages/auto-complete/ac-dict")
(ac-config-default)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; (add-hook 'c-mode-common-hook 
;;           '(lambda ()
;;              ;; ac-omni-completion-sources is made buffer local so
;;              ;; you need to add it to a mode hook to activate on 
;;              ;; whatever buffer you want to use it with.  This
;;              ;; example uses C mode (as you probably surmised).
;;              ;; auto-complete.el expects ac-omni-completion-sources to be
;;              ;; a list of cons cells where each cell's car is a regex
;;              ;; that describes the syntactical bits you want AutoComplete
;;              ;; to be aware of. The cdr of each cell is the source that will
;;              ;; supply the completion data.  The following tells autocomplete
;;              ;; to begin completion when you type in a . or a ->
;;              (add-to-list 'ac-omni-completion-sources
;;                           (cons "\\." '(ac-source-semantic)))
;;              (add-to-list 'ac-omni-completion-sources
;;                           (cons "->" '(ac-source-semantic)))
;;              ;; ac-sources was also made buffer local in new versions of
;;              ;; autocomplete.  In my case, I want AutoComplete to use 
;;              ;; semantic and yasnippet (order matters, if reversed snippets
;;              ;; will appear before semantic tag completions).
;;              (setq ac-sources '(ac-source-semantic ac-source-yasnippet))
;;              ))
;; (require 'auto-complete-clang)

;; (setq ac-auto-start nil)
;; (setq ac-quick-help-delay 0.5)
;; ;; (ac-set-trigger-key "TAB")
;; ;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;; (defun my-ac-config ()
;;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;   ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;   (add-hook 'css-mode-hook 'ac-css-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))
;; (defun my-ac-cc-mode-setup ()
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ;; ac-source-gtags
;; (my-ac-config)
