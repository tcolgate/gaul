; ----------------------------------------------------------------------
;    test-callback-object
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

(define-module (test-callback-object)
     #:use-module (oop goops)
     #:use-module (unit-test)
     #:use-module (gaul callback-object)
     #:duplicates merge-generics)


(define-class <test-callback-object> (<test-case>))

(define-class <mycbclass> (<gaul:callback-object>)
  (data #:init-value 0))

(define-method (myfunc (self <mycbclass>))
  (slot-set! self 'data (+ (slot-ref self 'data) 1)))

(define-method (myfunc2 (self <mycbclass>) arg)
  (slot-set! self 'data (+ (slot-ref self 'data) arg)))

(define-method (test-add-callback (self <test-callback-object>))
  (define myobj (make <mycbclass>))
  (add-callback myobj 'incdata (lambda()(myfunc myobj)))
  (add-callback myobj 'adddata (lambda(x)(myfunc2 myobj x)))
  (call-callbacks myobj 'none)
  (call-callbacks myobj 'incdata)
  (call-callbacks myobj 'incdata)
  (call-callbacks myobj 'adddata 10)
  (assert-equal 12 (slot-ref myobj 'data)))

(define-method (test-remove-callback (self <test-callback-object>))
  (define myobj (make <mycbclass>))
  (define cb-func (lambda(x)(myfunc2 myobj x)))
  (add-callback myobj 'adddata cb-func)
  (add-callback myobj 'adddata cb-func)
  (add-callback myobj 'adddata2 cb-func)
  (remove-callback myobj 'adddata cb-func)
  (call-callbacks myobj 'adddata 10)
  (call-callbacks myobj 'adddata2 10)
  (assert-equal 10 (slot-ref myobj 'data)))

(define-method (test-multiple-callback (self <test-callback-object>))
  (define myobj1 (make <mycbclass>))
  (define myobj2 (make <mycbclass>))
  (define myobj3 (make <mycbclass>))
  (define cb-func (lambda()(myfunc myobj1)))
  (define cb-func2 (lambda()(myfunc2 myobj1 10)))
  (add-callback myobj2 'update cb-func)
  (add-callback myobj3 'update cb-func2)
  (call-callbacks myobj2 'update)
  (call-callbacks myobj3 'update)
  (assert-equal 11 (slot-ref myobj1 'data)))

(exit-with-summary (run-all-defined-test-cases))

