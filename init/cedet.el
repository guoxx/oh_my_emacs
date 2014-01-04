;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;;                                   global-semantic-idle-completions-mode
;;                                   global-semanticdb-minor-mode
;;                                   global-semantic-idle-summary-mode
;;                                   global-semantic-mru-bookmark-mode
;;                                   global-semantic-highlight-func-mode
;;                                   ))

(semantic-mode 1)
(defun my-semantic-inhibit-func ()
  (cond
   ((member major-mode '(javascript- html-helper-mode html-mode))
    ;; to disable semantic, return non-nil.
    t)
   (t nil)))
(add-to-list 'semantic-inhibit-functions 'my-semantic-inhibit-func)

;; (global-semantic-highlight-edits-mode (if window-system 1 -1))
;; (global-semantic-show-unmatched-syntax-mode 1)
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
          (semantic-add-system-include dir 'c-mode)
          (semantic-add-system-include dir 'objc-mode))
        include-dirs))

(define-key semantic-mode-map (kbd "M-ESC") 'semantic-ia-complete-symbol)


(add-to-list 'load-path "~/.emacs.d/packages/gtags/")
(require 'gtags)
(setq gtags-global-command "/usr/local/bin/global")
(setq c-mode-hook
      '(lambda ()
         (gtags-mode 1)))
(setq c++-mode-hook
      '(lambda ()
         (gtags-mode 1)))
(define-key gtags-mode-map (kbd "C-c t") 'gtags-find-tag)
(define-key gtags-mode-map (kbd "C-c r") 'gtags-find-rtag)
(define-key gtags-select-mode-map (kbd "C-c b") 'gtags-pop-stack)
(define-key gtags-mode-map (kbd "C-c b") 'gtags-pop-stack)


(defun get-include-guard ()
  "Return a string suitable for use in a C/C++ include guard"
  (let* ((fname (buffer-file-name (current-buffer)))
         (fbasename (replace-regexp-in-string ".*/" "" fname))
         (inc-guard-base (replace-regexp-in-string "[.-]"
                                                   "_"
                                                   fbasename)))
    (concat "__" (upcase inc-guard-base) "__")))

(add-hook 'find-file-not-found-hooks
          '(lambda ()
             (let ((file-name (buffer-file-name (current-buffer))))
               (when (string= ".h" (substring file-name -2))
                 (let ((include-guard (get-include-guard)))
                   (insert "#ifndef " include-guard)
                   (newline)
                   (insert "#define " include-guard)
                   (newline 4)
                   (insert "#endif")
                   (newline)
                   (previous-line 3)
                   (set-buffer-modified-p nil))))))
