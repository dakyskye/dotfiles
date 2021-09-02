;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Lasha Kanteladze"
      user-mail-address "kanteladzelasha339@gmail.com")

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 12 :weight 'semi-light))

(setq org-directory "~/Documents/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

(require 'tree-sitter)
(require 'tree-sitter-langs)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(global-git-gutter-mode)

(setq treemacs-git-mode `extended)

(defun dynamic-doom-theme ()
  "Provide a Doom theme based on the current system theme."
  (let* ((res (doom-call-process "gsettings" "get" "org.gnome.desktop.interface" "gtk-theme"))
         (code (car res))
         (stdout (string-trim (cdr res))))
    (if (= code 0)
        (cond ((string= "'Arc-Dark'" stdout) 'doom-one)
              ((string= "'Arc-Lighter'" stdout) 'doom-one-light)
              (t 'doom-one))
      'doom-one)))

(setq doom-theme (dynamic-doom-theme))

(setq doom-themes-treemacs-theme 'default)
