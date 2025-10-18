#!r6rs

(library
    (Scheme-Error-Reporting error-reporting)
  (export
   add-error-reporting)

  (import
    (rnrs base (6))
    (rnrs exceptions (6))
    (rnrs conditions (6))
    (rnrs records syntactic (6)))

  (define-syntax add-error-reporting
    (syntax-rules (errors)
      ((_ ?who ?cond-ctor)
       (lambda (msg)
         (raise
          (condition
           (make-who-condition ?who)
           (make-message-condition msg)
           (?cond-ctor)))))
      ((_ ?who ?cond-ctor (errors ?error-state-0 ...))
       (lambda (msg)
         (raise
          (condition
           (make-who-condition ?who)
           (make-message-condition msg)
           (?cond-ctor '?error-state-0 ...))))))))