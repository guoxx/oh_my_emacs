(defvar target-os-mac 'mac)
(defvar target-os-linux 'gnu-linux)
(defvar target-os-win32 'win32)
(defvar target-os-unknown 'os-unknown)

(defun target-os ()
  (cond
   ((string-equal system-type "darwin") target-os-mac)
   ((string-equal system-type "gnu/linux") target-os-linux)
   ((string-equal system-type "windows-nt") target-os-linux)
   (t target-os-unknown)))
