; ----------------------------------------------------------------------
;    callback-object
;    Copyright (C) 2008 Tristan Colgate-McFarlane
;
;    This program is free software; you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation; either version 3 of the License, or
;    (at your option) any later version.
;
;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with this program; if not, write to the Free Software
;    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
; ----------------------------------------------------------------------

; This base class allows named callbacks to be registered against
; an object (such as the main world object) and is the primary means
; of event notification.

; The callbacks take the form of
; (name<string>  functions<generic> object<any>)
(define-module (gaul callback-object)
     #:use-module (srfi srfi-1)
     #:use-module (oop goops)
     #:duplicates merge-generics)

(define-class <gaul:callback-object> ()
	      (class-name #:init-value "<gaul:callback-object>")
	      (callbacks #:init-value '()))

(define-method (add-callback (self <gaul:callback-object>) 
			     (name <symbol>) 
			     call)
  (slot-set! self 'callbacks 
    (cons (cons name call) (slot-ref self 'callbacks))))

(define-method (remove-callback (self <gaul:callback-object>) 
				(name <symbol>)
				call)
  (slot-set! self 'callbacks 
    (remove (lambda(x)(equal? (cons name call) x)) (slot-ref self 'callbacks)))) 

(define-generic call-callbacks)

(define-method (call-callbacks (self <gaul:callback-object>) name)
  (define (call cb)
    (let ((cbname (car cb))
	  (call (cdr cb)))
      (if (eq? name cbname)
	         (call))))
  (for-each (lambda(cb)(call cb)) (slot-ref self 'callbacks)))

(define-method (call-callbacks (self <gaul:callback-object>) name arg)
  (define (call cb)
    (let ((cbname (car cb))
	  (proc (cdr cb)))
      (if (eq? name cbname)
	         (proc arg))))
  (for-each (lambda(cb)(call cb)) (slot-ref self 'callbacks)))

(export <gaul:callback-object> add-callback remove-callback call-callbacks)
