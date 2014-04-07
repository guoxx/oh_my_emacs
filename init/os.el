(defvar target-os-mac 'mac)
(defvar target-os-linux 'gnu-linux)
(defvar target-os-unknown 'os-unknown)

(defun target-os ()
  (cond
   ((string-equal system-type "darwin") target-os-mac)
   ((string-equal system-type "gnu/linux") target-os-linux)
   (else target-os-unknown)))
