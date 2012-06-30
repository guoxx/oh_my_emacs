;; (add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/color-theme-solarized/")
(add-to-list 'load-path "~/.emacs.d/lua-mode/")
(add-to-list 'load-path "~/.emacs.d/maxframe/")
(add-to-list 'load-path "~/.emacs.d/diff-mode/")
(add-to-list 'load-path "~/.emacs.d/protobuf-mode/")
(add-to-list 'load-path "~/.emacs.d/customize/")
(add-to-list 'load-path "~/.emacs.d/php-mode/")
;; (mapc 'load (directory-files "~/.emacs.d/init" t "^[a-zA-Z0-9].*.el$"))

;; ---------------------------------------------------------------------------
;; load packges
;;
(require 'undo-tree)
(global-undo-tree-mode)
;; ---------------------------------------------------------------------------

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

;; toolbar
(tool-bar-mode 0)

;; show line number
(global-linum-mode t)
(setq linum-format "%d| ")  ;set format
;; highlight current light
;; (if window-system
;;     (global-hl-line-mode nil))

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
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil)) 
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; y or n
(fset 'yes-or-no-p 'y-or-n-p)
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
(require 'color-theme)
(require 'color-theme-solarized)
(if window-system
    (color-theme-solarized-light))
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;;	undo-mode
;;
;; (require 'undo-tree)
;; (global-undo-tree-mode)
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;;	lua-mode
;;
(require 'lua-mode)
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;;	maxframe
;;
;; (require 'maximize)
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
(global-set-key (kbd "C-c t") 'toggle-transparency)
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
;;	diff-mode
;;
(require 'diff-mode-)
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;;	protobuf-mode
;;
(require 'protobuf-mode)
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
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
;; ---------------------------------------------------------------------------
