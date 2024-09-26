(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(package-selected-packages '(vertico undo-tree php-mode ace-window company))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight regular :height 158 :width normal)))))

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

;; Configure
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

;; Company-mode
(global-company-mode)

;; Autopair
;; (add-to-list 'load-path "~/.emacs.d/plugins/")
;; (require 'autopair)
;; (autopair-global-mode)			

;;Undo-tree
(use-package undo-tree
	     :ensure t
	     :init (global-undo-tree-mode))

;; Vertico
(use-package vertico
  :ensure t
  :init (vertico-mode)
  )
