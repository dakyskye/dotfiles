;; set credintials
(setq user-full-name "Lasha Kanteladze"
      user-mail-address "kanteladzelasha339@gmail.com")

;; font config
;;(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 11))

;; modifications to evil mode
(map! :mv "$" #'evil-last-non-blank) ;; g_

;; my favourite themes
(setq doom-theme 'doom-one)
;;(setq doom-theme 'doom-one-light)
;;(setq doom-theme 'doom-vibrant)
;;(setq doom-theme 'doom-dark+)
;;(setq doom-theme 'doom-dracula)
;;(setq doom-theme 'doom-gruvbox)
;;(setq doom-theme 'doom-horizon)
;;(setq doom-theme 'doom-nord-light)
;;(setq doom-theme 'doom-palenight)

;; set path for org docs
(setq org-directory "~/Documents")

;; display relative line numbers
(setq display-line-numbers-type 'relative)

;; enable tabs
(centaur-tabs-mode t)

;; neotree config
(after! doom-themes
  (setq doom-themes-neotree-file-icons t))
(after! neotree
  (setq neo-theme 'nerd))
