;; (use-package counsel
;;   :ensure t
;;   :bind
;;   (("M-y" . counsel-yank-pop)
;;    :map ivy-minibuffer-map
;;    ("M-y" . ivy-next-line)))

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)))


;; (use-package swiper
;;   :ensure t
;;   :bind (("C-s" . swiper)
;; 	 ("C-r" . swiper)
;; 	 ("C-c C-r" . ivy-resume)
;; 	 ("M-x" . counsel-M-x)
;; 	 ("C-x C-f" . counsel-find-file))
;;   :config
;;   (progn
;;     (ivy-mode 1)
;;     (setq ivy-use-virtual-buffers t)
;;     (setq ivy-display-style 'fancy)
;;     (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
;;     ))

(provide 'init-swiper)
