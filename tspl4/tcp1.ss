#! /usr/bin/env scheme-script
(import (chezscheme) (chezscheme tcp))

(define hostname "example.com")
(define port 80)

(let-values (((i o) (tcp-connect hostname port)))
  ; Send data
  (write-string "GET / HTTP/1.1\r\nHost: example.com\r\n\r\n" o)
  (flush-output-port o)

  ; Receive response
  (let loop ((buf (make-string 1024)))
    (let ((n (read! i buf)))
      (cond ((eof-object? n)
             (display "Connection closed by peer\n"))
            ((< n 0)
             (display "Error reading from socket\n"))
            ((zero? n)
             (display "No more data to read\n"))
            (else
             (display (substring buf 0 n))
             (loop (make-string 1024))))))

  ; Close connection
  (tcp-close i))

