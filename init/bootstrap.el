(setq save-place-file (concat oh-my-emacs-userdata-dir "places"))
(setq semanticdb-default-save-directory (concat oh-my-emacs-userdata-dir "semanticdb"))
(setq bookmark-default-file (concat oh-my-emacs-userdata-dir "bookmarks"))

(require 'projectile)
(setq projectile-known-projects-file (concat oh-my-emacs-userdata-dir "projectile-bookmarks.eld"))
(setq projectile-cache-file (concat oh-my-emacs-userdata-dir "projectile.cache"))

(setq use-empty-active-region 't)

(setq set-mark-command-repeat-pop 't)
(setq mark-ring-max 32)
(setq global-mark-ring-max 128)

(global-auto-revert-mode t)
