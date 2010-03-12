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
  #:use-module (gaul callback-object)
  #:use-module (gaul wall-clock)
  #:export (<gaul:world> worldclock display-world)
  #:export-syntax (world))

(define *global-clock* (make <gaul:wall-clock>))

(define-class <gaul:world> (<gaul:callback-object>)
  (worldclock #:init-value *global-clock* #:init-keyword #:clock #:accessor worldclock)
  (dirty #:init-value #f)
  (worldfunc #:init-value (lambda()(format #t "If a tree falls in an empty world, does it make a sound?~%"))))

(define-generic display-world)
(define-method (display-world (self <gaul:world>))
  (format #f "not done~%"))

(define-method (initialize (self <gaul:world>) initargs)
  (next-method)
  (add-callback (slot-ref self 'worldclock) 
                'value-changed 
                (lambda()(display-world self))))
  

