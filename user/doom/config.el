;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)
;; (require 'exwm-randr)
;; (setq exwm-randr-workspace-output-plist '(0 "DP-1" 1 "DP-3"))
;; (add-hook 'exwm-randr-screen-change-hook
;; 	  (lambda ()
;; 	    (start-process-shell-command
;; 	     "xrandr" nil "xrandr --output DP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-3 --primary --mode 1920x1080 --pos 1920x0 --rotate normal")))
;; (exwm-randr-enable)
;; (require 'exwm-systemtray)
;; (exwm-systemtray-enable)

(setq doom-theme 'doom-gruvbox)

(setq display-line-numbers-type t)

(setq org-directory "~/Notes/org/")
(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)

(add-to-list 'default-frame-alist '(alpha . 98))


