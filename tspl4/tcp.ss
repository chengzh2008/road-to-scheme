(import (chezscheme) (chezscheme tcp))

(define server-address "127.0.0.1")
(define server-port 8080)

(define socket (tcp-connect server-address server-port))

(display "Connected to server.\n")

;; Send data to server
(tcp-send socket "Hello, server!\n")

;; Receive data from server
(define response (tcp-recv socket))

(display response)

(tcp-close socket)

