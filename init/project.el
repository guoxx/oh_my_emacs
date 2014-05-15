;; projectile mode
(projectile-global-mode)
;; (setq projectile-enable-caching t)
(setq projectile-switch-project-action 'projectile-dired)
;; (setq projectile-project-root-files-functions '(projectile-root-top-down
;;                                                 projectile-root-top-down-recurring
;;                                                 projectile-root-bottom-up))
(setq projectile-git-command "git-ls-all-files")
;; replace method in projectile
(defun projectile-files-via-ext-command (command)
  "Get a list of relative file names in the project root by executing COMMAND."
  (split-string (shell-command-to-string command) "[\0\n]+" t))

(setq projectile-globally-ignored-files (append '("GRTAGS" "GTAGS" "GPATH") projectile-globally-ignored-files))
