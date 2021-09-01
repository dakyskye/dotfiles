;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Lasha Kanteladze"
      user-mail-address "kanteladzelasha339@gmail.com")

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 12 :weight 'semi-light))

(setq doom-theme 'doom-one)

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
(setq doom-themes-treemacs-theme `default)
