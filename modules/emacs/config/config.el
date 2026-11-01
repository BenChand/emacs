;; Use noctalia theme if available
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq doom-theme
      (if (locate-file "noctalia-theme" custom-theme-load-path '(".el" ".elc"))
          'noctalia
        'doom-one))

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 12.0))
(setq doom-modeline-height 35)
(setq confirm-kill-emacs nil)

(use-package nerd-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(after! centaur-tabs
  (define-key evil-normal-state-map (kbd "<S-right>") #'centaur-tabs-forward)
  (define-key evil-normal-state-map (kbd "<S-left>") #'centaur-tabs-backward))

(define-key evil-normal-state-map (kbd "<S-up>") (lambda () (interactive) (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "<S-down>") (lambda () (interactive) (evil-scroll-down nil)))

(map! :leader 
      "/" #'evilnc-comment-or-uncomment-lines
      "x" #'kill-current-buffer
      )

(with-eval-after-load 'projectile
  (setq projectile-enable-caching nil))
(after! projectile
  (add-to-list 'projectile-globally-ignored-directories "*.stfolder"))

(setq org-agenda-files '("~/org/"
                         "~/org/journal/")
      org-agenda-todo-ignore-scheduled 'future)

(add-hook 'org-trigger-hook 'save-buffer)

;; Org-mode journal settings
(after! org-journal
  (setq org-journal-date-prefix "#+TITLE: "
        org-journal-time-prefix "* "
        org-journal-date-format "%a, %Y-%m-%d"
        org-journal-file-format "%Y-%m-%d.org"
        org-journal-carryover-items ""
        )
  )

;; Org-mode roam settings
(setq org-roam-directory "~/org/roam")
