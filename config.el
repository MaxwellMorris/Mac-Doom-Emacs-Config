;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;;; EMAIL
(setq user-full-name "Maxwell Morris"
      user-mail-address "maxwell.morris@protonmail.com")

;;; FONTS
(setq doom-font (font-spec :family "Jetbrains Mono" :size 13 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Noto Serif" :size 13))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-comment-face :slant italic))

;;; THEME
(setq doom-theme 'doom-dracula)

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;;;ORG SUPERSTAR
(with-eval-after-load 'org-superstar
  (set-face-attribute 'org-superstar-item nil :height 1.3)
  (set-face-attribute 'org-superstar-header-bullet nil :height 1.3)
  (set-face-attribute 'org-superstar-leading nil :height 1.4));; Set different bullets, with one getting a terminal fallback.
(setq org-superstar-headline-bullets-list
      '("◉" "◈" "◎" "◌"))
;; Set up a different marker for graphic display.
(setq org-superstar-first-inlinetask-bullet ?🞸)
;; Stop cycling bullets to emphasize hierarchy of headlines.
(setq org-superstar-cycle-headline-bullets nil)
;; A simple period works fine, too.
(setq org-superstar-leading-fallback ?.)
(setq org-ellipsis "  ")


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)
;;; ORG ROAM
(setq org-roam-directory "~/Dropbox/org/orgroam")

;; Org-Roam UI
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(add-hook! 'org-mode-hook '+org-pretty-mode)

(toggle-frame-fullscreen)

(defun mm/PushWebsite()
  "This function runs the functions required to update my site.
   Exports the file to HTML.
   Then starts a magit commit"
  (interactive)
  (org-html-export-to-html)
  (magit)
  )
