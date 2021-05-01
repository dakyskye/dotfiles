(setq user-full-name "Lasha Kanteladze"
      user-mail-address "kanteladzelasha339@gmail.com")

(setq doom-theme 'doom-one)

(setq org-directory "~/Documents")

(setq display-line-numbers-type 'relative)

(setq which-key-idle-delay 0.3)
(which-key-mode)

(require 'tree-sitter)
(require 'tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(setq doom-themes-treemacs-theme "doom-colors")

(setq doom-font (font-spec :family "JetBrains Mono" :size 12)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 12)
      doom-big-font (font-spec :family "JetBrains Mono" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))
(setq global-prettify-symbols-mode t)
