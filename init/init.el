;; (add-to-list 'load-path "~/.emacs.d")
;; (mapc 'load (directory-files "~/.emacs.d/init" t "^[a-zA-Z0-9].*.el$"))

(add-to-list 'load-path "~/.emacs.d/customize/")

;; ---------------------------------------------------------------------------
;; common setting
;;

;; language environment
(setq current-language-environment "utf-8")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; show line number
(global-linum-mode t)
(setq linum-format "%d|")  ;set format
;; highlight current light
(blink-cursor-mode t)

;; tabbar mode
(if window-system
    ((lambda ()
       (global-hl-line-mode nil)
       (menu-bar-mode 1)
       (tool-bar-mode 0)
       (tabbar-mode t))))
(global-set-key (kbd "s-{") 'tabbar-backward-group)
(global-set-key (kbd "s-}") 'tabbar-forward-group)
(global-set-key (kbd "M-{") 'tabbar-backward-tab)
(global-set-key (kbd "M-}") 'tabbar-forward-tab)

;; set Tab
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-offset 4)

;; disable backup file like this foo~
(setq-default make-backup-files nil)
(setq make-backup-files nil)
;; disable autosave fiel like #foo#
(setq auto-save-default nil)

;; add /usr/local/bin to eshell path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin:~/bin:/usr/local/mysql/bin/:$HOME/Dropbox/bin"))
(setq exec-path (append exec-path '("/usr/local/bin:~/bin:/usr/local/mysql/bin/:$HOME/Dropbox/bin")))

;; buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; clipboard
;; (setq x-select-enable-clipboard t)
;; (defun copy-from-osx ()
;;   (shell-command-to-string "pbpaste"))

;; (defun paste-to-osx (text &optional push)
;;   (let ((process-connection-type nil)) 
;;     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;;       (process-send-string proc text)
;;       (process-send-eof proc))))

;; (setq interprogram-cut-function 'paste-to-osx)
;; (setq interprogram-paste-function 'copy-from-osx)

;; y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; scroll one line at a time (less "jumpy" than defaults)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;;	custom key
;;
;;(load "~/.emacs.d/config/emacs.el/CustomCommomEditKey.el")
;;(require 'CustomKey)
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;;	color-theme
;;
;; (if window-system
;;     (color-theme-solarized-light))
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;;	undo-mode
;;
(global-undo-tree-mode)
;; ---------------------------------------------------------------------------

;; ---------------------------------------------------------------------------
;;	maxframe
;;
;; (require 'maxframe)
;; (add-hook 'window-setup-hook 'maximize-frame t)
;; (defvar maxFrame-p nil "Check if fullscreen is on or off")
;; (defun maxOrMin-frame ()
;;   (interactive)
;;   (setq maxFrame-p (not maxFrame-p))
;;   (if maxFrame-p
;;       (restore-frame)
;;     (maximize-frame)))
;; (global-set-key (kbd "s-M") 'maxOrMin-frame)

(set-frame-parameter (selected-frame) 'alpha '(100 100))
(add-to-list 'default-frame-alist '(alpha 90 90))
(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(90 90))))
(global-set-key (kbd "C-x t") 'toggle-transparency)
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;;	auto-complete
;;
;; (add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
;; (ac-config-default)
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;;	shell-mode
;;
(require 'shell)
(defun clear-shell ()
  (interactive)
  (let ((old-max comint-buffer-maximum-size))
    (setq comint-buffer-maximum-size 0)
    (comint-truncate-buffer)
    (setq comint-buffer-maximum-size old-max)))

(eval-after-load "shell"
  '(define-key shell-mode-map (kbd "C-l") 'clear-shell))
;; ---------------------------------------------------------------------------

;; ---------------------------------------------------------------------------
;;	customize
;;
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;;	php-mode
;;
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.tpl$" . php-mode))
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;; slime
;;
(add-to-list 'load-path "~/.emacs.d/packages/slime/")
(require 'slime)
(require 'slime-autoloads)
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
(setq inferior-lisp-program "/usr/local/bin/ccl64") 
(slime-setup)
;; ---------------------------------------------------------------------------

;; ---------------------------------------------------------------------------
;; diff-mode
;;
(add-to-list 'load-path "~/.emacs.d/packages/diff/")
(require 'diff-mode-)
;; ---------------------------------------------------------------------------

;; ---------------------------------------------------------------------------
;; others
;;
(add-to-list 'load-path "~/.emacs.d/packages/")
(require 'powerline)
(require 'indent-hint)
(indent-hint-mode)

(defun concat-symbol (&rest lst)
  (intern (apply 'concat (mapcar (lambda(x)(if (symbolp x) (symbol-name x) x)) lst))))
(mapc (lambda (mode)
        (add-hook
         (concat-symbol mode '-hook)
         `(lambda ()
            (indent-hint-mode))
         ))
        '(lisp-mode
          lisp-interaction-mode
          emacs-lisp-mode
          lua-mode
          python-mode))


;; (require 'highlight-indentation)
;; (set-face-background 'highlight-indentation-face "#e3e3d3")
;; (set-face-background 'highlight-indentation-current-column-face "#c3b3b3")


;; (setq scroll-margin 1
;;       scroll-conservatively 10000)

(show-paren-mode t)
(setq show-paren-style 'parentheses)
(setq mouse-yank-at-point t)

(setq outline-minor-mode-prefix [(control o)])
;; ---------------------------------------------------------------------------
