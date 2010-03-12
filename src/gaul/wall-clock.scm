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
	#:duplicates merge-generics
        #:export (<gaul:wall-clock> time time-nocallbacks))

;  These classes repesent a wall clock. External source are used to drive
;  and update the clock. 
;
;  Callbacks:
;  	'update: Called whenever the time is changed

(define-class <gaul:wall-clock> (<gaul:callback-object>)
  (currtime #:init-value 0 #:accessor time-nocallbacks)
  (time #:allocation #:virtual 
        #:accessor time
        #:slot-ref (lambda (self) (time-nocallbacks self))
        #:slot-set! (lambda (self val)
                      (set! (time-nocallbacks self) val)
                      (call-callbacks self 'update))))


