; ----------------------------------------------------------------------
;    world.scm
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

(define-module (gaul world)
  #:use-module (oop goops)
  #:use-module (gaul logging)
  #:use-module (gaul callback-object)
  #:use-module (gaul wall-clock)
  #:export (<gaul:world> world:clock world:dirty world:func 
            display-world *global-world* *global-clock*)
  #:export-syntax (world))

(define *global-clock* (make <gaul:wall-clock>))

; These classes encapsulate a world.
;
; Callbacks:
; 		'world-pre-compile	: Called before compile
; 		'world-post-compile	: Called after copmilation
; 		'world-pre-eval		: Called before execution
; 		'world-post-eval	: Call after execution

(define-class <gaul:world> (<gaul:callback-object>)
  (world:clock #:init-value *global-clock* 
               #:init-keyword #:clock 
               #:accessor world:clock)
  (world:dirty #:init-value #f
               #:init-keyword #:dirty
               #:accessor world:dirty)
  (world:p:func #:init-value (lambda()(output "If a tree falls in an empty world, does it make a sound?~%")))
  (world:func #:allocation #:virtual
              #:slot-ref (lambda(self)(slot-ref self 'world:p:func))
              #:slot-set! (lambda(self arg)
                            (slot-set! self 'world:p:func arg)
                            (slot-set! self 'world:dirty #t)
                            (display-world self))
              #:accessor world:func))

(define-method (initialize (self <gaul:world>) initargs)
  (next-method)
  (add-callback (slot-ref self 'world:clock) 
                'value-changed 
                (lambda()(display-world self))))

(define *global-world* (make <gaul:world>))

(define-generic display-world)
(define-method (display-world (self <gaul:world>))
  (debug "not done~%"))

(define-syntax world
  (syntax-rules ()
    ((_ forms ...) (set! (world:func *global-world*)
                      (lambda() 
                         (call-callbacks *global-world* 'world-pre-eval)
                         forms ... 
                         (call-callbacks *global-world* 'world-post-eval))))))

