;; -*- lexical-binding: t; -*-

;; There is no console for emacs, so we use *message* buffer.
;; Or maybe we can create special buffer. Though need to consider --batch mode.
;; For warn, error we use 'Warnings' feature
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Warnings.html

(defvar Effect.Console._warnBuffer "*Warnings(psel)*")

(defvar Effect.Console.log
  (lambda (s)
    (lambda ()
      (message "Log (psel): %s" s))))

(defvar Effect.Console.warn
  (lambda (s)
    (lambda ()
      (display-warning 'psel s :warning Effect.Console._warnBuffer))))

(defvar Effect.Console.error
  (lambda (s)
    (lambda ()
      (display-warning 'psel s :error Effect.Console._warnBuffer))))

(defvar Effect.Console.info
  (lambda (s)
    (lambda ()
      (message "Info (psel): %s" s))))

;; Regisiters times

(defvar Effect.Console._timeMap '())

(defvar Effect.Console.time
  (lambda (name)
    (lambda ()
      (setq Effect.Console._timeMap
            (cons (cons name (current-time)) Effect.Console._timeMap)))))

(defvar Effect.Console.timeLog
  (lambda (name)
    (lambda ()
      (let ((v (assoc name Effect.Console._timeMap)))
        (if (null v)
            (display-warning 'psel
                             (concat "No time with name '" name "' found")
                             :warning
                             Effect.Console._warnBuffer)
          (message "TimeLog (psel): name=%s, duration=%s"
                   name
                   (format-time-string "%3N" (time-subtract (current-time) (cdr v)))))))))

(defvar Effect.Console.timeEnd
  (lambda (name)
    (lambda ()
      (let ((v (assoc name Effect.Console._timeMap)))
        (if (null v)
            (display-warning 'psel
                             (concat "No time with name '" name "' found")
                             :warning
                             Effect.Console._warnBuffer)
          (progn
            (message "TimeEnd (psel): name=%s, duration=%s"
                     name
                     (format-time-string "%3N" (time-subtract (current-time) (cdr v))))
            (setq Effect.Console._timeMap (assoc-delete-all name Effect.Console._timeMap))))))))

(defvar Effect.Console.clear
  (lambda ()
    (display-warning 'psel
                     "Ignoring 'clear' request"
                     :warning
                     Effect.Console._warnBuffer)))
