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
* add curl into win system for jupyter envi
   * download curl https://curl.haxx.se/windows/dl-7.64.0/curl-7.64.0-win64-mingw.zip
   * unzip the folder of bin into d:\home\bin
   * update %PATH% (d:\home\bin)
