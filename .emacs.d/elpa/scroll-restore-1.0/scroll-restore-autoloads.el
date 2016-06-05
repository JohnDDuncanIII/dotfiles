;;; scroll-restore-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "scroll-restore" "scroll-restore.el" (22196
;;;;;;  9479 0 0))
;;; Generated autoloads from scroll-restore.el

(defvar scroll-restore-mode nil "\
Non-nil if Scroll-Restore mode is enabled.
See the command `scroll-restore-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `scroll-restore-mode'.")

(custom-autoload 'scroll-restore-mode "scroll-restore" nil)

(autoload 'scroll-restore-mode "scroll-restore" "\
Toggle Scroll Restore mode.
With arg, turn Scroll Restore mode on if arg is positive, off
otherwise.

In Scroll Restore mode Emacs attempts to restore the original
position that existed before executing a sequence of scrolling
commands whenever that position becomes visible again.  The
option `scroll-restore-commands' permits to specify the set of
commands that may constitute such a sequence.  In addition you
can

- recenter the window when you scroll back to the original
  position, see the option `scroll-restore-recenter',

- aggressively jump back to the original position before
  executing a command not in `scroll-restore-commands', see
  `scroll-restore-jump-back',

- change the appearance of the cursor in the selected window
  while the original position is off-screen, see the option
  `scroll-restore-handle-cursor',

- change the appearance of the region in the selected window
  while the original position is off-screen, see the option
  `scroll-restore-handle-region'.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; scroll-restore-autoloads.el ends here
