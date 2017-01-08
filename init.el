;=================================
;; load path
;=================================
(setq load-path (append '("~/.emacs.d/lisp/"
			  "~/.emacs.d/lisp/color-theme-6.6.0/")
			  load-path))

;===================================
;; global definitions
;===================================
(setq user-full-name "Yoichi Ninomiya")
(setq user-mail-address "yoichi.ninomiya@cern.ch")

;; auto save off
(setq auto-save-default nil)

;=================================
;; set various functions
;=================================
;; delete start up message
(setq inhibit-startup-message t)
;; delete tool bar
(tool-bar-mode -1)
;; delete menu bar
(menu-bar-mode -1)
;; set scroll bar right
(set-scroll-bar-mode 'right)
;; show paired brackets
(show-paren-mode 1)
;; Visual feedback on selections
(setq-default transient-mark-mode t)
;; Always end a file with a newline
(setq require-final-newline t)
;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)
;; show column number
(setq column-number-mode t)
;; stop cursor blink
(blink-cursor-mode 0)
;; Enable wheelmouse support by default
(cond (window-system
       (mwheel-install)
))


(require 'tramp)
(setq tramp-default-method "sshx")

;===================================
;; open *.h by c++-mode
;===================================
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode))
	      auto-mode-alist))

(setq auto-mode-alist
      (append '(("Makefile.*$" . makefile-gmake-mode))
	      auto-mode-alist))

(setq auto-mode-alist
      (append '(("\\.txt$" . shell-script-mode))
	      auto-mode-alist))

;=================================
;; short cut key
;=================================
;; M-g -> goto-line
(global-set-key "\M-g" 'goto-line)
;; C-h -> back-space
(global-set-key "\C-h" 'backward-delete-char)
;; C-c -> Comment
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-c\C-r" 'uncomment-region)
;; C-r -> Scroll
(global-set-key "\C-r" 'scroll-down)
;; easy to use buffer-list
(global-set-key "\C-x\C-b" 'electric-buffer-list)
;; C-z -> undo 
(global-set-key "\C-z" 'undo)

(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;=================================
;; color theme
;=================================
(global-font-lock-mode t)
(require 'color-theme)
(color-theme-initialize)
(color-theme-nino)
;;(color-theme-midnight)
;;(color-theme-dark-laptop)

;===================================
;; tabbar-mode
;===================================
(require 'cl)
(when (require 'tabbar nil t)
  (setq tabbar-buffer-groups-function
	(lambda (b) (list "All Buffers")))
  (setq tabbar-buffer-list-function 
	(lambda ()
	  (remove-if
	   (lambda (buffer)
	     (find (aref (buffer-name buffer) 0) " *"))
	   (buffer-list))))
  (tabbar-mode))

(setq tabbar-home-button-enabled "")
(setq tabbar-scroll-left-button-enabled "")
(setq tabbar-scroll-right-button-enabled "")
(setq tabbar-scroll-left-button-disabled "")
(setq tabbar-scroll-right-button-disabled "")

(dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
  (autoload func "tabbar" "Tabs at the top of buffer and easy control-tab navigation"))
(defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
  `(defun ,name (arg)
     (interactive "P")
     ,do-always
     (if (equal nil arg)
	 ,on-no-prefix
         ,on-prefix)))
(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
(global-set-key [(control tab)] 'shk-tabbar-next)
(global-set-key [(control shift tab)] 'shk-tabbar-prev)
;
(set-face-attribute
 'tabbar-default-face nil
 :background "gray90"
 :height 1.0)
(set-face-attribute
 'tabbar-unselected-face nil
 :background "gray70"
 :foreground "black"
 :box nil)
(set-face-attribute
 'tabbar-selected-face nil
  :background "gray20"
  :foreground "white"
  :box nil)
;
(global-set-key [f4] 'tabbar-mode)
(global-set-key (kbd "\C-x\C-n") 'tabbar-forward)
(global-set-key (kbd "\C-x\C-p") 'tabbar-backward)
