(if (memq window-system '(w32)) 
	(progn 
		(defvar EHOME (substring data-directory 0 3)) 
		(setenv "HOME" (concat EHOME "home/")) 
		(setenv "PATH" (concat EHOME "home/")) 
		)) 

;;set the default file path 
(setq default-directory "~/") 
