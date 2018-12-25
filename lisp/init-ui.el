
;; Menu/Tool/Scroll bars
(unless *is-a-mac* (menu-bar-mode -1))
(and (bound-and-true-p tool-bar-mode) (tool-bar-mode -1))
(and (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(and (bound-and-true-p horizontal-scroll-bar-mode) (horizontal-scroll-bar-mode -1))

;; 显示行号
(global-linum-mode 1)

(use-package highlight-indentation
  :ensure t
  :config
  (highlight-indentation-mode t))
  ;; (set-face-background 'highlight-indentation-face "#e3e3d3")
  ;; (set-face-background 'highlight-indentation-current-column-face "#c3b3b3"))

;; setting theme
;; (use-package monokai-theme
;;   :ensure t)

;; (use-package zenburn-theme
;;   :ensure t)

(use-package solarized-theme
  :ensure t)
(load-theme 'solarized-dark t)
;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)
;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)
(setq x-underline-at-descent-line t)

;; (use-package gruvbox-theme
;;   :ensure t)

;;设置光标
(setq-default cursor-type 'bar)
(set-cursor-color "green")
;; 高亮当前行
(global-hl-line-mode t)
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)

;; -----------------------------------------------------------------------------
;; setting font for mac system
;; -----------------------------------------------------------------------------
;; Setting English Font
;; (set-face-attribute
;;  'default nil :font "Source Code Pro 14")

(set-face-attribute
 'default nil :font "Fira Code 14")
;; Chinese Font 配制中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Source Code Pro" :size 13)))

(use-package default-text-scale
  :ensure t
  :bind(
	("C-M-=" . default-text-scale-increase)
	("C-M--" . default-text-scale-decrease)))


;; powerline setting
;; (use-package powerline
;;   :ensure t
;;   :config
;;   (powerline-default-theme)
;;   (setq powerline-default-separator 'utf-8))

(setq evil-normal-state-tag   (propertize "[Normal]" 'face '((:background "green" :foreground "black")))
      evil-emacs-state-tag    (propertize "[Emacs]" 'face '((:background "orange" :foreground "black")))
      evil-insert-state-tag   (propertize "[Insert]" 'face '((:background "red") :foreground "white"))
      evil-motion-state-tag   (propertize "[Motion]" 'face '((:background "blue") :foreground "white"))
      evil-visual-state-tag   (propertize "[Visual]" 'face '((:background "grey80" :foreground "black")))
      evil-operator-state-tag (propertize "[Operator]" 'face '((:background "purple"))))

;; 简化 major-mode 的名字，替换表中没有的显示原名

(defun codefalling//simplify-major-mode-name ()
  "Return simplifyed major mode name"
  (let* ((major-name (format-mode-line "%m"))
         (replace-table '(Emacs-Lisp "𝝀"
                                     Spacemacs\ buffer "𝓢"
                                     Python "𝝅"
                                     Shell ">"
                                     Makrdown "𝓜"
                                     GFM "𝓜"
                                     Org "𝒪"
                                     Text "𝓣"
                                     Fundamental "ℱ"
                                     ))
         (replace-name (plist-get replace-table (intern major-name))))
    (if replace-name replace-name major-name
        )))

(setq-default
 mode-line-format
 (list
  ;; the buffer name; the file name as a tool tip
  " "
  '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                      'help-echo (buffer-file-name)))

  ;; line and column
  "(" ;; '%02' to set to 2 chars at least; prevents flickering
  (propertize "%02l" 'face 'font-lock-type-face) ","
  (propertize "%02c" 'face 'font-lock-type-face)
  ") "

  ;; relative position, size of file
  "["
  (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
  "/"
  (propertize "%I" 'face 'font-lock-constant-face) ;; size
  "] "

  ;; the current major mode for the buffer.
  "["

  '(:eval (propertize (codefalling//simplify-major-mode-name) 'face 'font-lock-string-face
                      'help-echo buffer-file-coding-system))
  "] "


  "[" ;; insert vs overwrite mode, input-method in a tooltip
  '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                      'face 'font-lock-preprocessor-face
                      'help-echo (concat "Buffer is in "
                                         (if overwrite-mode "overwrite" "insert") " mode")))

  ;; was this buffer modified since the last save?
  '(:eval (when (buffer-modified-p)
            (concat ","  (propertize "Mod"
                                     'face 'font-lock-warning-face
                                     'help-echo "Buffer has been modified"))))

  ;; is this buffer read-only?
  '(:eval (when buffer-read-only
            (concat ","  (propertize "RO"
                                     'face 'font-lock-type-face
                                     'help-echo "Buffer is read-only"))))
  "] "

  ;; evil state
  ;; '(:eval (evil-generate-mode-line-tag evil-state))

  " "
  ;; add the time, with the date and the emacs uptime in the tooltip
  '(:eval (propertize (format-time-string "%H:%M")
                      'help-echo
                      (concat (format-time-string "%c; ")
                              (emacs-uptime "Uptime:%hh"))))
  " --"
  ;; i don't want to see minor-modes; but if you want, uncomment this:
  ;; minor-mode-alist  ;; list of minor modes
  "%-" ;; fill with '-'
  ))

(use-package rainbow-identifiers
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(show-paren-mode 1)

(provide 'init-ui)
