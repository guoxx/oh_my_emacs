(setq save-place-file (concat userdata-dir "places"))
(setq semanticdb-default-save-directory (concat userdata-dir "semanticdb"))
(setq bookmark-default-file (concat userdata-dir "bookmarks"))

(require 'projectile)
(setq projectile-known-projects-file (concat userdata-dir "projectile-bookmarks.eld"))
(setq projectile-cache-file (concat userdata-dir "projectile.cache"))
