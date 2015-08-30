;;;; this is the emacs config file

;;evil
(add-to-list 'load-path "~/.emacs.d/elpa/evil-20150830.57")
(add-to-list 'load-path "~/.emacs.d/elpa/goto-chg-20131228.659")
(add-to-list 'load-path "~/.emacs.d/elpa/undo-tree-20140509.522")
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/elpa/popup-20150626.711")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150618.1949")
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20150618.1949/dict")
(ac-config-default)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;;magit
(add-to-list 'load-path "~/.emacs.d/elpa/dash-20150829.433")
(add-to-list 'load-path "~/.emacs.d/elpa/magit-popup-20150824.1010")
(add-to-list 'load-path "~/.emacs.d/elpa/git-commit-20150824.1010")
(add-to-list 'load-path "~/.emacs.d/elpa/with-editor-20150829.516")
(add-to-list 'load-path "~/.emacs.d/elpa/magit-20150830.544")
(require 'magit)

;;key bind
(define-prefix-command 'master-sense-map)
(global-set-key (kbd "C-\\") 'master-sense-map)
(define-key master-sense-map (kbd "C-\\") 'execute-extended-command)
(define-key master-sense-map (kbd "r") 'rgrep)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq-default c-basic-offset 4
              tab-width 4)
(setq indent-line-function 'insert-tab)

(setq tab-stop-list 
      '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80
	  84 88 92 96 100 104 108 112 116 120 124))

(funcall (lambda ()
  ;;this function will call at end of this file
  (setq make-backup-files nil)
  (setq make-backup-files nil)
  ;;(setq-default tab-width nil)
  (global-auto-revert-mode nil)))

(if (eq system-type "darwin")
    ;;append brew path
    (setq PATH (format "%s:%s" "/usr/local/bin" (getenv "PATH")))
    (setq exec-path (append exec-path '("/usr/local/bin"))))

(setq auto-mode-alist
   (append
    '(("\\.cc$"   	           . c++-mode)
	 ("\\.cpp$"  	           . c++-mode)
	 ("\\.ipp$"  	           . c++-mode)
	 ("\\.hpp$"  	           . c++-mode)
	 ("\\.h[r]?[0-9]*[a-z]?$"  . c++-mode))
    auto-mode-alist))

;; Put this one at the front of the list to override the default
;; c-mode association.
(setq auto-mode-alist (cons (cons "\\.h$" 'c++-mode) auto-mode-alist))

(setq nxml-child-indent 4)  ;; work convention is 4 spaces for HTML, etc
(setq nxml-outline-child-indent 4)
(setq mumamo-submode-indent-offset 4)
(setq sgml-basic-offset 4)

;;show current time

(display-time-mode 1)

;; set font on linux (ubuntu) 等宽字体设置
(if (eq system-type 'gnu/linux)
    (if (display-graphic-p)
        (progn (set-default-font "Ubuntu Mono:pixelsize=16") 
               (dolist (charset '(kana han symbol cjk-misc bopomofo)) 
                 (set-fontset-font (frame-parameter nil 'font) 
                                   charset 
                                   (font-spec :family "WenQuanYi Micro Hei" :size 16))))))

(defalias 'make 'compile)
(defalias 'fd   'find-name-dired)
(defalias 'nu   'linum-mode)

(setq user-full-name "Daniel C")

;;Intent setup
(defun long-arguments-indent-setup () (c-set-offset 'arglist-intro '+))
(add-hook 'c-mode-hook 'long-arguments-indent-setup)
(add-hook 'c++-mode-hook 'long-arguments-indent-setup)

;;force vertical split
(setq split-height-threshold 0)
(setq split-width-threshold nil)
