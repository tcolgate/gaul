; ----------------------------------------------------------------------
;    clock.scm
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
;

(define-module (gaul wall-clock)
	#:use-module (oop goops)
	#:use-module (gaul callback-object)
	#:duplicates merge-generics)


;  These classes repesent a wall clock. External source are used to drive
;  and update the clock. 
;
;  Callbacks:
;  	'update: Called whenever the time is changed

(define-class <gaul:wall-clock> (<gaul:callback-object>)
	      (class-name #:init-value "gaul:wall-clock")
	      (currtime #:init-value 0))

(define-method (set-time! (self <gaul:wall-clock>) 
			  (val <integer>)
			  (donotifies <boolean>))
  (slot-set! self 'currtime val)
  (call-callbacks self 'update))

(export <gaul:wall-clock> set-time!)

