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
(global-visual-line-mode 1)
(global-linum-mode t)
;; (setq linum-format "%d|")

;; highlight current light
(blink-cursor-mode t)

;; set Tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)

;; disable backup file like this foo~
(setq-default make-backup-files nil)
(setq make-backup-files nil)
;; disable autosave fiel like #foo#
(setq auto-save-default nil)

;; buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; clipboard
;; (setq x-select-enable-clipboard t)

;; y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; scroll one line at a time (less "jumpy" than defaults)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; mini buffer
(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-window (active-minibuffer-window))))
(global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)

(delete-selection-mode t)

(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; startup fullscreen
;; (custom-set-variables
;;  '(initial-frame-alist (quote ((fullscreen . maximized)))))
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;; color-theme
;;
;; (if window-system
;;     (load-theme 'solarized-light t))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; (if window-system
;;     (load-theme 'solarized-dark t))
(if window-system
    (progn
      (setq molokai-theme-kit t)
      (load-theme 'molokai t)
      (powerline-default-theme)))
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;; tabbar
;;
(if window-system
    (global-hl-line-mode nil))
(menu-bar-mode 1)
(setq tool-bar-mode -1)

;; (tabbar-mode 1)

(eval-after-load 'tabbar
  '(progn
     (custom-set-variables
      '(tabbar-separator (quote (2)))
      '(tabbar-use-images nil))

     (defmacro tabbar-customize-faces-macro (foreground background sforeground uforeground ubackground)
       `(custom-set-faces
         '(tabbar-button ((t (:inherit tabbar-default))))
         '(tabbar-default ((((class color grayscale) (background dark)) (:inherit variable-pitch :background ,background :foreground ,foreground :height 2))))
         '(tabbar-highlight ((t (:overline ,background))))
         '(tabbar-selected ((t (:inherit tabbar-default :background "background-color-at-point" :foreground ,sforeground))))
         '(tabbar-unselected ((t (:inherit tabbar-default :background ,ubackground :foreground ,uforeground)))))
       )

     (tabbar-customize-faces-macro
      "gray50"                               ;foreground
      "gray15"                               ;background
      "white"                                ;sforeground
      "gray60"                               ;uforeground
      "gray15"                               ;ubackground
      )

     (set-face-attribute 'tabbar-default nil :height 1.0)
     ))
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;; undo-mode
;;
(global-undo-tree-mode)
(defun undo-tree-clear ()
  (interactive)
  (setq buffer-undo-tree nil))
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;; transparency
;;
(set-frame-parameter (selected-frame) 'alpha '(92 92))
(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(92 92))))
(global-set-key (kbd "C-x t") 'toggle-transparency)
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;; shell-mode
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

(when (eq (target-os) target-os-mac)
  (exec-path-from-shell-initialize))
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;; php-mode
;;
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.tpl$" . php-mode))
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


(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(setq mouse-yank-at-point t)

(setq outline-minor-mode-prefix [(control o)])
;; ---------------------------------------------------------------------------


;; ---------------------------------------------------------------------------
;; helm
;;
(require 'helm)
(require 'helm-utils)
(require 'helm-config)
(helm-mode 1)
;; ---------------------------------------------------------------------------

;; ---------------------------------------------------------------------------
;; starter kit
;;
(remove-hook 'prog-mode-hook 'idle-highlight-mode)
(remove-hook 'prog-mode-hook 'esk-local-comment-auto-fill)
(remove-hook 'prog-mode-hook 'esk-pretty-lambdas)
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
;; ---------------------------------------------------------------------------

;; ---------------------------------------------------------------------------
;; ls
;;
(setq ls-lisp-use-insert-directory-program nil)
(require 'ls-lisp)

;; projectile mode
(projectile-global-mode)
;; (setq projectile-enable-caching t)


(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(yas/global-mode)
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory yas/root-directory)


(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d/userdata/"))


(defun ibuffer-ido-find-file (file &optional wildcards)
  "Like `ido-find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((default-directory
           (let ((buf (ibuffer-current-buffer)))
             (if (buffer-live-p buf)
                 (with-current-buffer buf
                   default-directory)
               default-directory))))
     (list (ido-read-file-name "Find file: " default-directory) t)))
  (find-file file wildcards))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (define-key ibuffer-mode-map "\C-x\C-f"
              'ibuffer-ido-find-file)))
