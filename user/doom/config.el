;; Theme Configuration ----------------------------------------------------------

(setq doom-theme 'doom-oceanic-next)

(add-to-list 'default-frame-alist '(alpha . 95))

(setq visual-fill-column-width 110
      visual-fill-column-center-text t)

;; Font Configuration ----------------------------------------------------------

;;(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 15)
;;(setq doom-font (font-spec :family "OpenDyslexic Nerd Font" :size 15)
(setq doom-font (font-spec :family "hack" :size 15)
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

;; Package Manager Configuration  ----------------------------------------------------------

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

(require 'ereader)

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
(setq org-ellipsis " ▾")

(defun center-org-mode ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))
(add-hook 'org-mode-hook 'center-org-mode)

;; Keybinding Configuration ----------------------------------------------------------

(map! :leader
      :desc "alt-zen"
      "t o" #'olivetti-mode)
(map! :leader
      :desc "Calendar"
      "o c" #'=calendar)
(map! :leader
      :desc "visual-fill"
      "t c" #'visual-fill-column-mode)

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
