;; set credintials
(setq user-full-name "Lasha Kanteladze"
      user-mail-address "kanteladzelasha339@gmail.com")

;; set theme
(setq doom-theme 'doom-one)

;; set path for org docs
(setq org-directory "~/Documents")

;; display relative line numbers
(setq display-line-numbers-type `relative)

;; enable tabs
(centaur-tabs-mode t)

;; neotree config
(setq neo-smart-open t)
(after! doom-themes
  (setq doom-themes-neotree-file-icons t))
(after! neotree
  (setq neo-theme 'nerd))
