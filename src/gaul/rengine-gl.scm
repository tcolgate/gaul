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
  #:duplicates merge-generics
  #:export ( <rengine-gl> gl:context))

(define-class <rengine-gl> (<rengine-base>)
  (description #:init-value "Render to a GL context" #:getter description)
  (gl:context #:#init-value #f #:accessor gl:context))

; State manipulation

(define-method (render-begin (ctx <rengine-gl>))
(define-method (render-end (ctx <rengine-gl>))
(define-method (render-frame (ctx <rengine-gl>))
(define-method (camera (ctx <rengine-gl>))
(define-method (attribute-begin (ctx <rengine-gl>))
(define-method (attribute-end (ctx <rengine-gl>))
(define-method (transform-begin (ctx <rengine-gl>))
(define-method (transform-end (ctx <rengine-gl>))
(define-method (solid-begin (ctx <rengine-gl>))
(define-method (solid-end (ctx <rengine-gl>))
(define-method (motion-blur-begin (ctx <rengine-gl>))
(define-method (motion-blur-end (ctx <rengine-gl>))
(define-method (motion-blur (ctx <rengine-gl>))
(define-method (object-begin (ctx <rengine-gl>))
(define-method (object-end (ctx <rengine-gl>))
(define-method (translate (ctx <rengine-gl>))
(define-method (scale (ctx <rengine-gl>))
(define-method (skew (ctx <rengine-gl>))
(define-method (rotate (ctx <rengine-gl>))
(define-method (transform (ctx <rengine-gl>))
(define-method (concat-transform (ctx <rengine-gl>))
(define-method (projection (ctx <rengine-gl>))
(define-method (deformation (ctx <rengine-gl>))
(define-method (light-source (ctx <rengine-gl>))
(define-method (area-light-source (ctx <rengine-gl>))
(define-method (illuminate (ctx <rengine-gl>))
(define-method (color (ctx <rengine-gl>))
(define-method (opacity (ctx <rengine-gl>))
(define-method (surface (ctx <rengine-gl>))
(define-method (imager (ctx <rengine-gl>))
(define-method (atmosphere (ctx <rengine-gl>))
(define-method (exterior (ctx <rengine-gl>))
(define-method (interior (ctx <rengine-gl>))
(define-method (displacement (ctx <rengine-gl>))
(define-method (basis (ctx <rengine-gl>))
(define-method (trim-curve (ctx <rengine-gl>))
(define-method (identifier (ctx <rengine-gl>))
;
; Primitives (ctx <rengine-gl>))
(define-method (cone (ctx <rengine-gl>))
(define-method (cylinder (ctx <rengine-gl>))
(define-method (disk (ctx <rengine-gl>))
(define-method (hyperboloid (ctx <rengine-gl>))
(define-method (paraboloid (ctx <rengine-gl>))
(define-method (sphere (ctx <rengine-gl>))
(define-method (torus (ctx <rengine-gl>))
(define-method (polygon (ctx <rengine-gl>))
(define-method (points-polygons (ctx <rengine-gl>))
(define-method (general-polygon (ctx <rengine-gl>))
(define-method (points-general-polygons (ctx <rengine-gl>))
(define-method (patch (ctx <rengine-gl>))
(define-method (patch-mesh (ctx <rengine-gl>))
(define-method (nu-patch (ctx <rengine-gl>))
(define-method (subdivision-mesh (ctx <rengine-gl>))
(define-method (curves (ctx <rengine-gl>))
(define-method (points (ctx <rengine-gl>))
(define-method (object-instance (ctx <rengine-gl>))

