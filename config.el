(setq user-full-name "Vinicius Tozzi"
      user-mail-address "viniciustozzi@pm.me")

(setq doom-font (font-spec :family "Fira Mono" :size 16))
;(setq doom-theme 'doom-gruvbox)
;(setq doom-theme 'doom-dracula)
;(setq doom-theme 'doom-Iosvkem)
(setq doom-theme 'gruber-darker)
;(setq tao-theme-use-sepia nil)

(beacon-mode 1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-agenda-files '("~/org/roam/"))
(setq org-roam-index-file "~/org/index.org")

;;Org templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/roam/inbox.org" "Tasks")
         "* TODO %? %i")
        ("T" "Todo Tagged" entry (file+headline "~/org/roam/inbox.org" "Tasks")
         "* TODO %? %i %^g")
        ("j" "Journal entry" plain (function org-journal-find-location)
                               "** %(format-time-string org-journal-time-format)%^{Title}\n%i%?"
                               :jump-to-captured t :immediate-finish t)))

;Org journal
(setq org-journal-dir "~/org/roam/journal")

(defun org-journal-find-location ()
  ;; Open today's journal, but specify a non-nil prefix argument in order to
  ;; inhibit inserting the heading; org-capture will insert the heading.
  (org-journal-new-entry t)
  (unless (eq org-journal-file-type 'daily)
    (org-narrow-to-subtree))
  (goto-char (point-max)))

(setq org-journal-enable-agenda-integration t)

(setq shell-file-name "/bin/bash")

(setq display-line-numbers-type 'visual)

;(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
;(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
;(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
;(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

(use-package-hook! evil
  :pre-init
  (setq evil-respect-visual-line-mode t) ;; sane j and k behavior
  t)

; Make horizontal movement cross lines
(setq-default evil-cross-lines t)

(require 'google-translate)
(require 'google-translate-default-ui)
(require 'google-translate-smooth-ui)
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)
(global-set-key (kbd "C-c y") 'google-translate-at-point-reverse)
(global-set-key (kbd "C-c Y") 'google-translate-query-translate-reverse)

(setq google-translate-default-source-language "de")
(setq google-translate-default-target-language "en")
(defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))
(setq google-translate-backend-method 'curl)

(require 'org)
(require 'ob-clojure)
(setq org-babel-clojure-backend 'cider)
(require 'cider)

(require 'emms-setup)
(emms-all)
(emms-default-players)
;; Set music directory
(setq emms-source-file-default-directory "~/music")
;; Set app for for retrieving meta-data.
(setq emms-info-functions '(emms-info-exiftool))
;; Looks for album cover arts
(setq emms-browser-covers 'emms-browser-cache-thumbnail-async)

(setq elfeed-feeds
  '("https://hnrss.org/frontpage"
    "https://fedoramagazine.org/feed/"))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(when (daemonp)
  (exec-path-from-shell-initialize))

(setq user-mail-address "viniciustozzi@protonmail.com"
      user-full-name  "Vinicius Vieira Tozzi"
      mu4e-get-mail-command "mbsync -c ~/.mbsyncrc -a"
      mu4e-update-interval  300
      mu4e-main-buffer-hide-personal-addresses t
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "localhost"
      smtpmail-stream-type 'starttls
      smtpmail-auth-credentials "gpg2 --quiet --decrypt ~/.mbsync-pw-mailbox.gpg"
      smtpmail-smtp-service 1025
      mu4e-sent-folder "/.mail/Sent"
      mu4e-drafts-folder "/.mail/Drafts"
      mu4e-trash-folder "/.mail/Trash"
      mu4e-maildir-shortcuts
      '(("/.mail/Inbox"      . ?i)
        ("/.mail/Sent" . ?s)
        ("/.mail/Drafts"     . ?d)
        ("/.mail/Trash"      . ?t)))

;;Configuration for exwm
;;(require 'exwm)
;;(require 'exwm-config)
;;(exwm-config-default)
;(require 'exwm-randr)

;(setq exwm-randr-workspace-output-plist '(0 "LVDS1"))
;(add-hook 'exwm-randr-screen-change-hook
;          (lambda()
 ;           (start-process-shell-command
  ;           "xrandr" nil "xrandr --output LSVDS1 --mode 1600x900 --pos 0x0 --rotate normal")))
;(exwm-randr-enable)
;(require 'exwm-systemtray)
;(exwm-systemtray-enable)
