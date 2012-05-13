(add-to-list 'load-path "~/.emacs.d/gtags/")

(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semantic-idle-completions-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode
                                  global-semantic-highlight-func-mode))

(semantic-mode 1)
(defun my-semantic-inhibit-func ()
  (cond
   ((member major-mode '(javascript- html-helper-mode html-mode))
    ;; to disable semantic, return non-nil.
    t)
   (t nil)))
(add-to-list 'semantic-inhibit-functions 'my-semantic-inhibit-func)

(global-semantic-highlight-edits-mode (if window-system 1 -1))
(global-semantic-show-unmatched-syntax-mode 1)
(global-semantic-show-parser-state-mode 1)

(defconst user-include-dirs
  (list ".." "../include" "../inc" "../.." "../../include" "../../inc"))
(defconst sys-include-dirs
  (list "/usr/include"
        "/usr/local/include"))
(let ((include-dirs user-include-dirs))
  (setq include-dirs (append include-dirs sys-include-dirs))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

(define-key semantic-mode-map (kbd "M-ESC") 'semantic-ia-complete-symbol)


(require 'gtags)
(setq gtags-global-command "/usr/local/bin/global")
(setq c-mode-hook
      '(lambda ()
         (gtags-mode 1)))
(define-key gtags-mode-map (kbd "C-g f t") 'gtags-find-tag)
(define-key gtags-mode-map (kbd "C-g f r") 'gtags-find-rtag)
(define-key gtags-select-mode-map (kbd "C-g b") 'gtags-pop-stack)
(define-key gtags-mode-map (kbd "C-g b") 'gtags-pop-stack)
