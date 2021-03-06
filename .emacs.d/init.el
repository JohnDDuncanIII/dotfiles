; use the Melpa package repo
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(add-to-list 'load-path "~/.emacs.d/tabbar/")

;; for OS X
(when (eq system-type 'darwin)
  ;; set OS X system path
  (setenv "PATH" (concat "/opt/pkg/bin" ":" (getenv "PATH")))
  ;; disable annoying press and hold functionality
  (ns-set-resource nil "ApplePressAndHoldEnabled" "NO")
  ;; default Latin font
  (set-face-attribute 'default nil :family "System_16")
  (set-face-attribute 'default nil :height 160)
  ;(set-face-attribute 'default nil :family "Cream_12")
  ;(set-face-attribute 'default nil :height 120)
  ;; default font size (point * 10)
  ;; use specific font for Korean charset.
  (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

  ;; replace highlighted text with what I type
  (delete-selection-mode 1)

  ;;(global-set-key [wheel-up] 'ignore)
  ;;(global-set-key [wheel-down] 'ignore)
  (global-set-key [wheel-right] 'ignore)
  (global-set-key [wheel-left] 'ignore)
  ;;(global-set-key [double-wheel-up] 'ignore)
  ;;(global-set-key [double-wheel-down] 'ignore)
  (global-set-key [double-wheel-right] 'ignore)
  (global-set-key [double-wheel-left] 'ignore)
  ;;(global-set-key [triple-wheel-up] 'ignore)
  ;;(global-set-key [triple-wheel-down] 'ignore)
  (global-set-key [triple-wheel-right] 'ignore)
  (global-set-key [triple-wheel-left] 'ignore)

  ;; stripe buffer
  ;;(add-hook 'dired-mode-hook 'turn-on-stripe-buffer-mode)

  ;;(stripe-buffer-mode 1)
  (require 'stripe-buffer)
 ;; (stripe-buffer-mode 1)
  (set-face-background stripe-highlight-face "#F9F9F9")

  ;; indent global
  (indent-guide-global-mode)
  ;; tab indent stuff
  (require 'highlight-indent-guides)

  (require 'symon)
  (symon-mode)

  ;;highlight the current line. emacs 21+ compat
  (global-hl-line-mode)
  ;;(set-face-background 'hl-line "#330")  ;; Emacs 22 Only

  ;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
  (load-theme 'leuven t)
  ;; set fringe (for line wrapping icon on either side of the editor
  (set-face-background 'fringe "#F6F6F6")
  ;; set paren match background color to old leueven cursor color
  (custom-set-faces
  ;;'(show-paren-match ((t (:background "#0FB300"))))
   '(show-paren-match ((t (:background "#9FA8FF"))))
   '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white")))))

  ;; scroll one line at a time (less "jumpy" than defaults)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
  ;;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  ;;(setq scroll-step 1) ;; keyboard scroll one line at a time


  ;; enable parenthesis highlighting
  (show-paren-mode t)
  (setq show-paren-delay 0) ; disable delay

  ;; enable line nums
  (global-linum-mode t)

  ;; save buffer undo history on exit
  (add-to-list 'desktop-locals-to-save 'buffer-undo-list)

  ;; save desktop session on exit
  (desktop-save-mode 1)
  (setq-default left-margin-width 4 right-margin-width 0) ; Define new widths.
  (set-window-buffer nil (current-buffer)) ; Use them now.

  ;; Set tabs to 4 spaces
  (setq-default indent-tabs-mode t)
  (setq standard-indent 4)
  (setq tab-width 4)
  (setq sgml-basic-offset 4)
  ;; Display tabs and trailing spaces
  (global-whitespace-mode t)
  (setq-default whitespace-style '(face tab trailing))

  ;; Electric
  (electric-indent-mode -1)
  (electric-pair-mode -1)

  ;; Save command history across sessions
  (savehist-mode)

  ;; Navigate windows with M-<arrows>
  ;;(windmove-default-keyBindings 'meta)

  ;; Prettify programming languages syntax
  (global-prettify-symbols-mode)

  ;; Display column number
  (column-number-mode)

  ;; Allow upcase-region
  (put 'upcase-region 'disabled nil)

  ;; scrollers - scroll buffer not point
  (global-set-key "\M-n" "\C-u1\C-v")
  (global-set-key "\M-p" "\C-u1\M-v")

  ;; Restore the cursor when you scroll past it on the buffer
  (require 'scroll-restore)
  (scroll-restore-mode 1)
  ;; Allow scroll-restore to modify the cursor face
  (setq scroll-restore-handle-cursor t)
  ;; Make the cursor invisible while POINT is off-screen
  (setq scroll-restore-cursor-type nil)
  ;; Jump back to the original cursor position after scrolling
  (setq scroll-restore-jump-back t)
  ;; Toggle scroll-restore-mode with the Scroll Lock key
  (global-set-key (kbd "<Scroll_Lock>") 'scroll-restore-mode)
  ;;(setq scroll-preserve-screen-position t
  ;;        scroll-conservatively 0)

  ;; Display file path in the title bar
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b"
                   ))))
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode php-mode highlight-indent-guides stripe-buffer symon scroll-restore leuven-theme indent-guide))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:background "#9FA8FF"))))
 '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white")))))
