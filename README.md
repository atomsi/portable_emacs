# portable_emacs
building personal portable emacs
## 运行环境:
1. win7+
2. emacs 26.1 for win64
3. USB storage
## Steps:
1. download & unzip emacs
2. config emacs' home folder in "D:\tools\emacs-26.1-x86_64\share\emacs\site-lisp\site-start.el
```
(if (memq window-system '(w32)) 
	(progn 
		(defvar EHOME (substring data-directory 0 3)) 
		(setenv "HOME" (concat EHOME "home/")) 
		(setenv "PATH" (concat EHOME "home/")) 
		)) 

;;set the default file path 
(setq default-directory "~/") 
```
3. emacs' customizations 
* python customeizaitons (from http://codingpy.com/article/emacs-the-best-python-editor/)
```
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
;;(elpy-use-ipython) this one is out of time.
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")


;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
	(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; DOWN MODE CONFIGURATION
;; --------------------------------------

(require markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; init.el ends here
```
* add curl into win system for jupyter envi
   * download curl https://curl.haxx.se/windows/dl-7.64.0/curl-7.64.0-win64-mingw.zip
   * unzip the folder of bin into d:\home\bin
   * update %PATH% (d:\home\bin)
* enable markdown mode
```
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
```
