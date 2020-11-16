;; set credintials
(setq user-full-name "Lasha Kanteladze"
      user-mail-address "kanteladzelasha339@gmail.com")

;; modifications to evil mode
(map! :mv "$" #'evil-last-non-blank) ;; g_
(map! :nv "<up>" 'nil)
(map! :nv "<down>" 'nil)
(map! :nv "<right>" 'nil)
(map! :nv "<left>" 'nil)

;; my favourite themes
;;(setq doom-theme 'doom-one)
;;(setq doom-theme 'doom-one-light)
;;(setq doom-theme 'doom-vibrant)
;;(setq doom-theme 'doom-dark+)
(setq doom-theme 'doom-dracula)
;;(setq doom-theme 'doom-gruvbox)
;;(setq doom-theme 'doom-horizon)
;;(setq doom-theme 'doom-nord-light)
;;(setq doom-theme 'doom-palenight)

;; set path for org docs
(setq org-directory "~/Documents")

;; display relative line numbers
(setq display-line-numbers-type `relative)

;; enable tabs
(centaur-tabs-mode t)

;; enable colours
(setq rainbow-mode t)

;; lsp-ui configo
(setq lsp-ui-peek-enable `t)

;; neotree config
(setq neo-smart-open t)
(after! doom-themes
  (setq doom-themes-neotree-file-icons t))
(after! neotree
  (setq neo-theme 'nerd))
