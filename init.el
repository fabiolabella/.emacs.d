;; ========== Setup ==========

;; Package list 
(require 'package)
(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
;; Load PATH from bash
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "PS1")
(exec-path-from-shell-copy-env "CELLAR")


;; ========== Backup and autosaves ==========

;; Enable backup files.
(setq make-backup-files t)
;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)
;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
;; Autosave Files in Specific directory
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/autosaves/" t)))



;; ========== General Appearance and Settings==========

;; Inhibit startup message 
(setq inhibit-startup-message t) 
;; Disable the toolbar
(tool-bar-mode -1)
;; Colour theme 
(load-theme 'tango-dark t) 
;; Use line numbers globally
(global-linum-mode t)
;; Show line-number in the mode line
(line-number-mode 1)
;; Show column-number in the mode line
(column-number-mode 1)
;;Prompt y or n instead of yes or no always.
(fset 'yes-or-no-p 'y-or-n-p)
;; Use only spaces for indentatin
(setq-default indent-tabs-mode nil) 
;;Support Wheel Mouse Scrolling 
(mouse-wheel-mode t)

;; ========== Core usage ==========

;; Set Right Command as Ctrl 
(setq mac-right-command-modifier 'control)
;; Window management
(global-set-key (kbd "C-x o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(windmove-default-keybindings)
;; Enable Ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-ubiquitous-mode 1)
;; Enable Smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; Redefine common keybindings to work smoothly with keychords
(global-set-key (kbd "C-x f") 'find-file)
(global-set-key (kbd "C-x C-f") 'set-fill-column)
(global-set-key (kbd "C-x s") 'save-buffer)
(global-set-key (kbd "C-x C-s") 'save-some-buffers)
;; God mode
(require 'god-mode)
(global-set-key (kbd "<escape>") 'god-local-mode)
(setq god-exempt-major-modes nil)
(setq god-exempt-predicates nil)
;; Update cursor when in god mode
(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'bar
                      'box)))
(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)
;; Use god mode in search and smex
(require 'god-mode-isearch)
(define-key isearch-mode-map (kbd "<escape>") 'god-mode-isearch-activate)
(define-key god-mode-isearch-map (kbd "<escape>") 'god-mode-isearch-disable)
(define-key god-local-mode-map (kbd "i") 'god-local-mode)
(define-key god-local-mode-map (kbd ".") 'repeat)
;; Key chords 
(require 'key-chord)
(key-chord-define-global "fk" 'smex)
(key-chord-define-global "fj" ctl-x-map)
(key-chord-define-global "jk" 'god-local-mode)
(key-chord-mode +1)



;; ========== Haskell mode ==========

(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)
;;This is the only useful shortcut not enabled out of the box
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)









