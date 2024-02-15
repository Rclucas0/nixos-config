;; Theme Configuration ----------------------------------------------------------

(setq doom-theme 'doom-oceanic-next)

(add-to-list 'default-frame-alist '(alpha . 95))

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Font Configuration ----------------------------------------------------------

(defvar doommacs/default-font-size 120)

;;(set-face-attribute 'default nil :font "OpenDyslexicAlt Nerd Font" :height doommacs/default-font-size)
(setq doom-font (font-spec :family "OpenDyslexicAlt Nerd Font" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15)
      doom-big-font (font-spec :family "OpenDyslexicAlt Nerd Font" :size 24))
;;(after! doom-themes
;;  (setq doom-themes-enable-bold t
;;           doom-themes-enable-italic t))
;;(custom-set-faces!
;;  '(font-lock-comment-face :slant italic)
  ;; '(font-lock-keyword-face :slant itanic))
;; Set the fixed pitch face
;;(set-face-attribute 'fixed-pitch nil :font "OpenDyslexicAlt Nerd Font" :height 260)

;; Set the variable pitch face
;; (set-face-attribute 'variable-pitch nil :font "Cantarell" :height 295 :weight 'regular)

(require 'empv)
(require 'nov)
(require 'ereader)
(require 'neotree)

;; Line-Number Configuration ----------------------------------------------------------

(setq display-line-numbers-type t)
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Org Configuration ----------------------------------------------------------

(setq org-directory "~/Notes/org/")
(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)

;; Keybinding Configuration ----------------------------------------------------------

(map! :leader
      :desc "alt-zen"
      "t o" #'olivetti-mode)
(map! :leader
      :desc "Calendar"
      "o c" #'=calendar)

;; EXWM Configuration ----------------------------------------------------------

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
