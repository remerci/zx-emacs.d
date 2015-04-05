;; add by zx, set lang env -> Chinese
(set-language-environment 'Chinese-GB)
;(set-keyboard-coding-system 'euc-cn)
;(set-clipboard-coding-system 'euc-cn)
;(set-terminal-coding-system 'euc-cn)
;(set-buffer-file-coding-system 'euc-cn)
;(set-selection-coding-system 'euc-cn)
;(prefer-coding-system 'euc-cn)
;(modify-coding-system-alist 'process "*" 'euc-cn)
;(setq default-process-coding-system '(euc-cn . euc-cn))
;(setq-default pathname-coding-system 'euc-cn)

;; EIM Input Method. Use C-\ to toggle input method.
(autoload 'eim-use-package "eim" "Another emacs input method")
;(setq eim-use-tooltip nil)              ; don't use tooltip
(setq eim-punc-translate-p nil)         ; use English punctuation
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "pinyin" "EIM Chinese Pinyin Input Method" (file-truename "~/.eim/py.txt")
 'my-eim-py-activate-function)
(register-input-method
 "eim-wb" "euc-cn" 'eim-use-package
 "五笔" "汉字五笔输入法" (file-truename "~/.eim/wb.txt")
 'my-eim-py-activate-function)
(setq default-input-method "eim-wb")

;; 用 ; 暂时输入英文, add by zx
(require 'eim-extra)
(global-set-key ";" 'eim-insert-ascii)

;; (toggle-input-method nil)               ; default is turn off
(defun my-eim-py-activate-function ()
  (add-hook 'eim-active-hook
            (lambda ()
              (let ((map (eim-mode-map)))
                (define-key eim-mode-map "-" 'eim-previous-page)
                (define-key eim-mode-map "=" 'eim-next-page)))))

;; make ime compatible with evil-mode
(defun evil-toggle-input-method ()
  "when toggle on input method, switch to evil-insert-state if possible.
when toggle off input method, switch to evil-normal-state if current state is evil-insert-state"
  (interactive)
  ;; some guy donot use evil-mode at all
  (if (fboundp 'evil-insert-state)
      (if (not current-input-method)
          (if (not (string= evil-state "insert"))
              (evil-insert-state))
        (if (string= evil-state "insert")
            (evil-normal-state)
          )))
  (toggle-input-method))

(global-set-key (kbd "C-\\") 'evil-toggle-input-method)


(provide 'init-eim)
