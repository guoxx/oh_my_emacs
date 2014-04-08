(if (equal (target-os) target-os-mac)
    (progn
      (setq mac-option-modifier 'meta)
      (setq mac-command-modifier 'super)))
