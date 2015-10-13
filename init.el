;; ========== Package list ==========
(require 'package)
(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)


;; ========== Load PATH from bash ==========
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "PS1")
(exec-path-from-shell-copy-env "CELLAR")


;; ========== Inhibit startup message ===========
(setq inhibit-startup-message t) 


;; ========== Disable the toolbar ==========
(tool-bar-mode -1)


;; ========== Use line numbers globally ==========
(global-linum-mode t)


;; ========== Prompt y or n ==========
;;Prompt y or n instead of yes or no always.
(fset 'yes-or-no-p 'y-or-n-p)


;; =========== Turn off tab character ===========
;; Emacs normally uses both tabs and spaces to indent lines. If you
;; prefer, all indentation can be made from spaces only. To request this,
;; set `indent-tabs-mode' to `nil'. This is a per-buffer variable;
;; altering the variable affects only the current buffer, but it can be
;; disabled for all buffers.
;; Use (setq ...) to set value locally to a buffer
;; Use (setq-default ...) to set value globally 
;;
(setq-default indent-tabs-mode nil) 


;; ========== Support Wheel Mouse Scrolling ==========
(mouse-wheel-mode t)


;; ========== Place Backup Files in Specific Directory ==========
;; Enable backup files.
(setq make-backup-files t)


;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)


;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))


;; ========== Place Autosave Files in Specific Directory ==========
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/autosaves/" t)))


;; ========== Enable Line and Column Numbering ==========
;; Show line-number in the mode line
(line-number-mode 1)
;; Show column-number in the mode line
(column-number-mode 1)


;; ========== Redefine some common keybindings ==========
;; the following are redefined so that common commands
;; only require one C-x prefix, that will be bound to
;; a keychord
(global-set-key (kbd "C-x f") 'find-file)
(global-set-key (kbd "C-x C-f") 'set-fill-column)
(global-set-key (kbd "C-x s") 'save-buffer)
(global-set-key (kbd "C-x C-s") 'save-some-buffers)


;; ========== Ido mode and Smex ==========
;; Enable Ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-ubiquitous-mode 1)
;; Enable Smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; ========== Set Right Command as Ctrl ==========
(setq mac-right-command-modifier 'control)


;; ========== Window management ==========
(global-set-key (kbd "C-x o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(windmove-default-keybindings)


;; ========== Haskell mode ==========
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)
;;This is the only useful shortcut not enabled out of the box
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)


;; ========== Colour theme ==========
(load-theme 'tango-dark t) 


;; ========== Key chords ==========
(require 'key-chord)
(key-chord-define-global "fk" 'smex)
(key-chord-define-global "fj" ctl-x-map)
(key-chord-mode +1)



