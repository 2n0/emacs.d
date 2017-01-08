(deftheme cbn
  "color theme")

(custom-theme-set-faces
 'cbn

 ;; background, characters, cursor 
 '(cursor ((t (:foreground "grey85"))))
 '(default ((t (:background "black" :foreground "snow"))))
 '(mouse ((t (:foreground "grey85"))))

 ;; cursor region
 '(region ((t (:background "slategray"))))
 
 ;; highlight
 '(highlight ((t (:background "blue")))) 
 '(highline-face ((t (:background "grey12"))))

 '(font-lock-comment-face ((t (:italic t :foreground "brown1"))))
 '(font-lock-string-face ((t (:foreground "yellow2"))))
 '(font-lock-keyword-face ((t (:foreground "Cyan"))))
 '(font-lock-warning-face ((t (:bold t :foreground "Pink"))))
 '(font-lock-constant-face ((t (:foreground "Magenta"))))
 '(font-lock-type-face ((t (:foreground "light sea green"))))
 '(font-lock-variable-name-face ((t (:foreground "DarkGoldenrod3"))))
 '(font-lock-function-name-face ((t (:foreground "MediumPurple1"))))
 '(font-lock-builtin-face ((t (:foreground "light sky blue"))))


 '(setnu-line-number-face ((t (:background "Grey15" :foreground "White" :bold t))))
 '(show-paren-match-face ((t (:background "grey30"))))


 '(secondary-selection ((t (:background "navy"))))
 '(widget-field-face ((t (:background "navy"))))
 '(widget-single-line-field-face ((t (:background "royalblue")))) )

(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))
(provide-theme 'cbn)
