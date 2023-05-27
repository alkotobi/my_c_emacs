(eval-after-load 'autoinsert
  '(define-auto-insert '(nim-mode . "Nim skeleton")
     '(
       "#------------------------------------------------------\n "
       "# " (file-name-nondirectory (buffer-file-name)) \n
       "#" \n
       "# By Merhab Noureddine\n"
       "# On " (format-time-string "%A, %e %B %Y.") \n
       "#" >  \n
       "#------------------------------------------------------" \n
       \n)))

;; (defun shell-command-on-buffer ()
  ;; "Asks for a command and executes it in inferior shell with current buffer
;; as input."
  ;; (interactive)
  ;; (shell-command-on-region
   ;; (point-min) (point-max)
   ;; (read-shell-command "nim c " "./" (file-name-nondirectory (buffer-file-name)) )))
;; (add-hook 'nim-mode
          ;; (lambda () (local-set-key (kbd "C-c C-c") 'shell-command-on-buffer)))
 ;; (defun compile-nim ()
   ;; (interactive)         
   ;; (set (make-local-variable 'compile-command) "nim c " "./" (file-name-nondirectory (buffer-file-name)) )
   ;; (call-interactively 'compile))

;; (global-set-key [f5] (lambda ()
                       ;; (interactive)
		        ;; (set (make-local-variable 'compile-command) "nim c " "./" (file-name-nondirectory (buffer-file-name)) ) "" ""
                       ;; (let ((current-prefix-arg '(4)))
                         ;; (call-interactively 'compile))))

(defun mn-nim-compile()
  (interactive)
  (let* ((src (file-name-nondirectory (buffer-file-name)))
         (exe (file-name-sans-extension src)))
    (compile (concat "nim c -r --debugger:native --verbosity\:0 --excessiveStackTrace\:on " "./" src ))))
(add-hook 'nim-mode-hook
          (lambda () (local-set-key (kbd "<f9>") #'mn-nim-compile)))
