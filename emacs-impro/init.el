;; make emacs stop creating “backup~” files or “#autosave#” file
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files


(add-to-list 'load-path "~/.emacs.d/elpa/")
;; Programming Stuff

;; sml
;;(setenv "PATH" (concat "/usr/local/smlnj/bin:" (getenv "PATH")))
;;(setq exec-path (cons "/usr/local/smlnj/bin"  exec-path))

;; geiser racket and scheme

;;(setq geiser-racket-binary "/Applications/Racket v6.2.1/bin/racket")
;;(setq geiser-mit-binary "/usr/local/bin/scheme")

(load-library "xscheme")

;;(setq inhibit-default-init t)
;;(setq inhibit-splash-screen t
;;      initial-scratch-message nil)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives  '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;; solve TLS/SSL issues
(setq tls-checktrust t)
(setq gnutls-verify-error t)
(let ((trustfile "/etc/ssl/cert.pem"))
   (setq tls-program
         `(,(format  "gnutls-cli --x509cafile %s -p %%p %%h" trustfile)
           ,(format "openssl s_client -connect %%h:%%p -CAfile %s -no_ssl2 -ign_eof" trustfile)))
   (setq gnutls-trustfiles (list trustfile)))


(set-default-font "Monaco 16")

; set default directory
(setq default-directory "~/Documents/Programming/")
(add-to-list 'load-path "~/.emacs.d")
(setq warning-minimum-level :emergency)

(setq inhibit-startup-message t) ;; hide the startup message
(tool-bar-mode -1)

; (use-package color-theme
;    :ensure t)

;;To map the the left alt key with META and the right alt key with ALT
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

; Font Size
; (set-face-attribute 'default nil :height 100)
; The value is in 1/10pt, so 100 will give you 10pt, etc. 
;(set-default-font "Monospace-14")
;(set-default-font "Monaco 16" nil t)
; You can use `C-x C-+’ and ‘C-x C--’ (‘text-scale-adjust’) to increase or decrease the buffer text size (`C-+’ or ‘C--’ to repeat).


; (setq debug-on-error t)


; what is ido mode?
;; interactively do things
;; It AUTOMATICALLY show list of choices as you type (no need to press Tab first).
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


(global-linum-mode t) ;; enable line numbers globally


; C-x b   switch-buffer
; C-x C-b     list-buffers
;; (defalias 'list-buffers 'ibuffer) ; make ibuffer default

;;Or if you want to open ibuffer in another Window:

(defalias 'list-buffers 'ibuffer-other-window) ; make ibuffer default


;; if you like using tabs as in browser, at the top
;; (use-package tabbar
;;   :ensure t
;;     :config (tabbar-mode 1)
;;     )


;;key     what it does
;;C-x 2   split-window-below (vertically)
;;C-x 3   split-window-right (horizontally)
;;C-x 0   delete-window (this one)
;;C-x 1   delete-other-windows
;;C-x o   other-window (moves foxus to the next window
;;


;; color-themes
(load-theme 'solarized-dark t)

;; (use-package nlinum
;;   :config
;;   (global-nlinum-mode))

;; Bootstrap `use-package'
;(unless (package-installed-p 'use-package)
;        (package-refresh-contents)
;        (package-install 'use-package))
;
(use-package try
         :ensure t)
;
(use-package which-key
             :ensure t 
             :config
             (which-key-mode))


; autocompletion
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))


; yasnippet

(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))

; jedi

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

;; GUI height and width
;;
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 120) ; chars
              (height . 60) ; lines
              ;;(background-color . "honeydew")
              (left . 50)
              (top . 50)))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 120)
              (height . 60)
              ;;(background-color . "honeydew")
              (left . 50)
              (top . 50))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

; (setq mac-option-key-is-meta t)
; (setq mac-right-option-modifier nil)

; (setq mac-command-modifier 'meta)
; (setq mac-option-modifier nil)
;(if (string-match "Aquamacs\\|NS apple-appkit\\|NS appkit" (emacs-version))
; (progn
; (global-set-key "\M-g" (lambda () (interactive) (insert-string "@")))
; (global-set-key "\M-n" (lambda () (interactive) (insert-string "~")))
; (global-set-key "\M-5" (lambda () (interactive) (insert-string "[")))
; (global-set-key "\M-6" (lambda () (interactive) (insert-string "]")))
; (global-set-key "\M-7" (lambda () (interactive) (insert-string "|")))
; (global-set-key "\M-8" (lambda () (interactive) (insert-string "{")))
; (global-set-key "\M-9" (lambda () (interactive) (insert-string "}")))
; (global-set-key "\M-/" (lambda () (interactive) (insert-string "\\")))
; (global-set-key "\M-e" (lambda () (interactive) (insert-string "€")))
; )
;)


; This is what I have in my .emacs file:

;;; I prefer cmd key for meta
;(setq mac-option-key-is-meta nil
;      mac-command-key-is-meta t
;      mac-command-modifier 'meta
;      mac-option-modifier 'none)

; (setq mac-option-key-is-meta t)
; (setq mac-right-option-modifier nil)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (jedi-direx which-key try zenburn-theme yasnippet use-package solarized-theme sml-mode monokai-theme jedi gruvbox-theme geiser creamsody-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
