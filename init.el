 ;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; package manage
(require 'init-package)

;; base setting
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-swiper)
(require 'init-org)
(require 'init-exec-path-from-shell)
(require 'init-dired)
;; program setting
(require 'init-git)
(require 'init-company)
(require 'init-flycheck)
(require 'init-program)
(require 'init-ruby)
(require 'init-web)
(require 'init-python)
(require 'init-go)
(require 'init-yaml)
(require 'init-markdown)
(require 'init-cpp)
