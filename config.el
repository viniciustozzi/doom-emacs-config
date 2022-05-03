(setq user-full-name "Vinicius Tozzi"
      user-mail-address "viniciustozzi@pm.me")

(map! :leader
      (:prefix-map ("l" . "LSP")
        :desc "Format code" "f" #'lsp-format-buffer
        :desc "Find reference" "r" #'lsp-find-references))

(global-set-key (kbd "C-M-l") 'lsp-format-buffer)
(global-set-key (kbd "M-<f7>") 'lsp-find-references)
(global-set-key (kbd "M-7") 'lsp-find-references)

(map! :leader
      (:prefix-map ("t" . "Tab Mode")
        :desc "New Tab" "n" #'tab-bar-new-tab
        :desc "Search Tab By Name" "SPC" #'tab-bar-select-tab-by-name
        :desc "Switch Tab" "s" #'tab-bar-switch-to-next-tab))

(setq doom-font (font-spec :family "Hack" :size 18))
;(setq doom-theme 'doom-gruvbox)
;(setq doom-theme 'doom-dracula)
;(setq doom-theme 'doom-Iosvkem)
;(setq doom-theme 'gruber-darker)
;(setq tao-theme-use-sepia nil)
(require 'modus-themes)
(setq doom-theme 'modus-vivendi)

(beacon-mode 1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(after! org
  (setq org-hide-emphasis-markers t
      org-pretty-entities t
      org-ellipsis " ▾"
      org-log-done 'time
      org-directory "~/org/"
      org-agenda-files '("~/org/roam/daily")
      org-todo-keywords '((sequence "TODO(t)" "|" "DONE(d)" "CANCELLED(c)" ))
      org-todo-keywords-1 '((sequence "TODO(t)" "|" "DONE(d)" "CANCELLED(c)" ))
      )
  (setq org-roam-index-file "~/org/index.org")
  (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/roam/inbox.org" "Tasks")
         "* TODO %? %i")
        ("T" "Todo Tagged" entry (file+headline "~/org/roam/inbox.org" "Tasks")
         "* TODO %? %i %^g")
        ("j" "Journal entry" plain (function org-journal-find-location)
                               "** %(format-time-string org-journal-time-format)%^{Title}\n%i%?"
                               :jump-to-captured t :immediate-finish t))))

;;Org templates


;;When text mode center content in screen
(require 'olivetti)
(add-hook 'text-mode-hook
          'olivetti-mode)
(olivetti-set-width 100)

(after! rustic
  (setq rustic-lsp-server 'rls))

;Org journal
;Currently disabled as I am trying to use org-roam-dailies instead of org-journal
;(setq org-journal-dir "~/org/roam/journal")
;(defun org-journal-find-location ()
  ;; Open today's journal, but specify a non-nil prefix argument in order to
  ;; inhibit inserting the heading; org-capture will insert the heading.
;  (org-journal-new-entry t)
;  (unless (eq org-journal-file-type 'daily)
;    (org-narrow-to-subtree))
;  (goto-char (point-max)))

;(setq org-journal-enable-agenda-integration t)

(setq shell-file-name "/bin/bash")

(setq display-line-numbers-type 'visual)

(use-package ob-translate)

;(require 'google-translate)
;(require 'google-translate-default-ui)
;(require 'google-translate-smooth-ui)
;(global-set-key "\C-ct" 'google-translate-smooth-translate)
;(global-set-key "\C-cy" 'google-translate-at-point)
;(setq google-translate-translation-directions-alist '(("de" . "en"), ("en" "de")))

;(global-set-key "\C-ct" 'google-translate-at-point)
;(global-set-key "\C-cT" 'google-translate-query-translate)

(setq go-translate-local-language "de")
(setq go-translate-target-language "en")
(global-set-key "\C-ct" 'go-translate)
(global-set-key "\C-cy" 'go-translate-popup)
(setq go-translate-token-current (cons 430675 2721866130))

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

;; (setq user-mail-address "viniciustozzi@protonmail.com"
;;       user-full-name  "Vinicius Vieira Tozzi"
;;       mu4e-get-mail-command "mbsync -c ~/.mbsyncrc -a"
;;       mu4e-update-interval  300
;;       mu4e-main-buffer-hide-personal-addresses t
;;       message-send-mail-function 'smtpmail-send-it
;;       smtpmail-smtp-server "localhost"
;;       smtpmail-stream-type 'starttls
;;       smtpmail-auth-credentials "gpg2 --quiet --decrypt ~/.mbsync-pw-mailbox.gpg"
;;       smtpmail-smtp-service 1025
;;       mu4e-sent-folder "/.mail/Sent"
;;       mu4e-drafts-folder "/.mail/Drafts"
;;       mu4e-trash-folder "/.mail/Trash"
;;       mu4e-maildir-shortcuts
;;       '(("/.mail/Inbox"      . ?i)
;;         ("/.mail/Sent" . ?s)
;;         ("/.mail/Drafts"     . ?d)
;;         ("/.mail/Trash"      . ?t)))
