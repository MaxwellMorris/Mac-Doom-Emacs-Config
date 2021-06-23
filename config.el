;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Maxwell Morris"
      user-mail-address "maxwell.morris@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;

;;; FONTS
(setq doom-font (font-spec :family "Jetbrains Mono" :size 13 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Noto Serif" :size 13))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-comment-face :slant italic))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")



(global-prettify-symbols-mode +1)


(defun enhance-ui-for-orgmode ()
  "Enhance UI for orgmode."
  (toggle-truncate-lines)
  (linum-mode -1)
  ;; Beautify Org Checkbox Symbol
  (push '("[ ]" . "") prettify-symbols-alist)  ;;
  (push '("[X]" . "" ) prettify-symbols-alist) ;;
  (push '("[-]" . "" ) prettify-symbols-alist) ;;
  (push '("#+BEGIN_SRC" . "⌜" ) prettify-symbols-alist)
  (push '("#+END_SRC" . "⌞" ) prettify-symbols-alist)
  ;; (push '("TODO" . "" ) prettify-symbols-alist)
  ;; (push '("DONE" . "" ) prettify-symbols-alist)
  (prettify-symbols-mode)
  (set-face-attribute 'org-level-1 nil :height 1.0 :background nil :weight 'bold)
  (set-face-attribute 'org-level-2 nil :height 1.0 :background nil :weight 'semi-bold)
  (dolist (face '(org-level-3 org-level-4 org-level-5))
    (set-face-attribute face nil :weight 'normal :height 1.0))
  (setq org-fontify-done-headline t)
  (set-face-attribute 'org-done nil :strike-through t)
  (set-face-attribute 'org-headline-done nil
                      :strike-through t
                      :foreground "dark gray"))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-hook 'org-mode-hook (lambda ()                   ;;
;;    "Beautify Org Checkbox Symbol"                ;;
;;    (push '("[ ]" . "") prettify-symbols-alist)  ;;
;;    (push '("[X]" . "" ) prettify-symbols-alist) ;;
;;    (push '("[-]" . "ﯰ" ) prettify-symbols-alist) ;;
;;    (prettify-symbols-mode)))                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "✔ DONE(d)")
(sequence "⚑ WAITING(w)" "|")
(sequence "|" "✘ CANCELED(c)")))

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

(use-package! org-roam
  :init
  (setq org-roam-directory "~/Dropbox/org/orgroam")
  (setq org-roam-completion-system 'default)
)


;;; ORG ROAM SERVER

(use-package org-roam-server
  :ensure t
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))

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
(require 'org-roam-protocol)


(add-hook! 'org-mode-hook '+org-pretty-mode)
(add-hook! 'org-mode-hook 'enhance-ui-for-orgmode)
(add-hook 'after-init-hook 'org-roam-mode)

(toggle-frame-fullscreen)
