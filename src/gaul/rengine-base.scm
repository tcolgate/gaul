; ----------------------------------------------------------------------
;    engine-base.scm`
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
(define-module (gaul rengine-base)
  #:use-module (oop goops)
  #:use-module (srfi srfi-39)
  #:use-module (gaul logging)
  #:duplicates merge-generics
  #:export ( <rengine-base> description))

(define-class <rengine-base> ()
  (description #:init-value "Base renderer class" #:getter description))

; State manipulation

(define-syntax define-render-methods
  (syntax-rules ()
    ((_ name)      
     (begin
       (define-generic name)
       (define-method (name)
         (name (*current-renderer*)))
       (define-method (name (ctx <rengine-base>))
         (output "No default renderer specified~%"))
       (export name)))
    ((_ name (argname argtype) ...)      
     (begin
       (define-generic name)
       (define-method (name (argname argtype) ...)
         (name (*current-renderer*) argname ...))
       (define-method (name (ctx <rengine-base>) (argname argtype) ...)
         (output "No default renderer specified~%"))
       (export name)))))

(define-render-methods render-begin (name <string>) (name2 <string>))
(define-render-methods render-end)
(define-render-methods render-frame)

(define-render-methods camera)
(define-render-methods attribute-begin)
(define-render-methods attribute-end)
(define-render-methods transform-begin)
(define-render-methods transform-end)
(define-render-methods solid-begin)
(define-render-methods solid-end)
(define-render-methods motion-blur-begin)
(define-render-methods motion-blur-end)
(define-render-methods motion-blur)
(define-render-methods object-begin)
(define-render-methods object-end)
(define-render-methods translate)
(define-render-methods scale)
(define-render-methods skew)
(define-render-methods rotate)
(define-render-methods transform)
(define-render-methods concat-transform)
(define-render-methods projection)
(define-render-methods deformation)
(define-render-methods light-source)
(define-render-methods area-light-source)
(define-render-methods illuminate)
(define-render-methods color)
(define-render-methods opacity)
(define-render-methods surface)
(define-render-methods imager)
(define-render-methods atmosphere)
(define-render-methods exterior)
(define-render-methods interior)
(define-render-methods displacement)
(define-render-methods basis)
(define-render-methods trim-curve)
(define-render-methods identifier)
;
; Primitives)
(define-render-methods cone)
(define-render-methods cylinder)
(define-render-methods disk)
(define-render-methods hyperboloid)
(define-render-methods paraboloid)
(define-render-methods sphere)
(define-render-methods torus)
(define-render-methods polygon)
(define-render-methods points-polygons)
(define-render-methods general-polygon)
(define-render-methods points-general-polygons)
(define-render-methods patch)
(define-render-methods patch-mesh)
(define-render-methods nu-patch)
(define-render-methods subdivision-mesh)
(define-render-methods curves)
(define-render-methods points)
(define-render-methods object-instance)

(define *current-renderer* (make-parameter (make <rengine-base> )))

