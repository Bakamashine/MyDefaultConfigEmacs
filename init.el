(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)

(package-initialize)


;; Global mappings
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
(global-unset-key "\C-x\C-u")
(global-unset-key "\C-xf")
(global-set-key [f8] 'eshell)

(global-set-key [f6] 'neotree)
(global-set-key [f5] 'find-file-in-project)
(global-set-key (kbd "C-'") #'imenu-list-smart-toggle)


(setq make-backup-files nil)		;Отключение создания бекапа файла
(setq auto-save-default nil)		;Отключения автосохранения
(setq auto-save-list-file-name nil)	;Отключение именования автосохранённого файла
(menu-bar-mode -1)			;Удаление верхнего меню
(tool-bar-mode -1)			;Отключение  панели инструментов
(blink-cursor-mode -1)			;Отключение мигания курсора
(setq use-dialog-box nil)		;Отключение всплывающих окон
(setq ring-bell-function 'ignore)	;Отключение звукого сигнала
;; (setq lsp-enable-file-watchers nil) 	;Расскомментировать если будет лагать lsp-mode
(delete-selection-mode 't)		;Замена выделенного текста после начала ввода
(global-auto-revert-mode 't)		;Автообновление буффера
(setq inhibit-splash-screen   t)	;Удаление экрана приветствия
(setq ingibit-startup-message t)	;Удаление экрана приветствия
(global-hl-line-mode t)			;Подсветка строки
(add-hook 'prog-mode-hook #'display-line-numbers-mode) ;Разметка строки
(scroll-bar-mode -1)				       ;Отключение полосы прокрутки
(setq display-line-numbers-mode 't)		       ;Пронумерование строк
(setq default-input-method 'russian-computer)			       ;Стандартный метод переключения языка
;; Ace window
(use-package ace-window
  :ensure t
  :init (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
              aw-char-position 'left
              aw-ignore-current nil
              aw-leading-char-style 'char
              aw-scope 'frame)
  :bind (("\C-xo" . ace-window))
  )
(use-package undo-tree
	     :ensure t
	     :init (global-undo-tree-mode))

;; Vertico
(use-package vertico
  :ensure t
  :init (vertico-mode)
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(auctex phps-mode company lsp-ui lsp-mode imenu-list find-file-in-project neotree magit vertico undo-tree ace-window php-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Magit
(use-package magit
  :ensure t
  )

(use-package lsp-mode
  :ensure t
  :hook
  ((c-mode . lsp)
   (c++-mode . lsp))
  :config
  (setq lsp-prefer-flymake nil)  ;; Использовать lsp-ui вместо flymake
)


;; Company-mode configuration
(use-package company
  :defer t
  :init
  (add-hook 'text-mode-hook #'company-mode)
  (add-hook 'latex-mode-hook #'company-mode)
  (add-hook 'LaTeX-mode-hook #'company-mode) ;; for AUCTeX users
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.2
        company-show-numbers t
        company-tooltip-align-annotations t)
  (define-key company-active-map (kbd "TAB") #'company-complete-selection)
  (define-key company-active-map (kbd "<tab>") #'company-complete-selection))
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))
(add-hook 'text-mode-hook
          (lambda ()
            (when (and buffer-file-name
                       (string-match-p "\\.txt\\'" buffer-file-name))
              (company-mode 1))))

;; (use-package company
;;   :ensure t
;;   :init
;;   (add-hook 'text-mode-hook #'company-mode)
;;   (add-hook 'latex-mode-hook #'company-mode)
;;   (add-hook 'LaTeX-mode-hook #'company-mode) ;; for AUCTeX users
;;   :hook (lsp-mode . company-mode)  ;; Включить company-mode при запуске lsp-mode
;;   :config
;;   (setq company-minimum-prefix-length 1)
;;   (setq company-idle-delay 0.0)

;;   )
(load-theme 'deeper-blue)
