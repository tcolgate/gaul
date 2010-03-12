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
  #:export ( <engine-base> description render-begin render-end render-frame
camera attribute-begin attribute-end transform-begin transform-end solid-begin
solid-end motion-blur-begin motion-blur-end motion-blur object-begin object-end
translate scale skew rotate transform concat-transform projection deformation
light-source area-light-source illuminate color opacity surface imager
atmosphere exterior interior displacement basis trim-curve identifier cone
cylinder disk hyperboloid paraboloid sphere torus polygon points-polygons
general-polygon points-general-polygons patch patch-mesh nu-patch
subdivision-mesh curves points object-instance))

(define-class <engine-base> ())

; Render class info

(define-generic description)

; State manipulation

(define-generic render-begin)
(define-generic render-end)
(define-generic render-frame)
(define-generic camera)
(define-generic attribute-begin)
(define-generic attribute-end)
(define-generic transform-begin)
(define-generic transform-end)
(define-generic solid-begin)
(define-generic solid-end)
(define-generic motion-blur-begin)
(define-generic motion-blur-end)
(define-generic motion-blur)
(define-generic object-begin)
(define-generic object-end)
(define-generic translate)
(define-generic scale)
(define-generic skew)
(define-generic rotate)
(define-generic transform)
(define-generic concat-transform)
(define-generic projection)
(define-generic deformation)
(define-generic light-source)
(define-generic area-light-source)
(define-generic illuminate)
(define-generic color)
(define-generic opacity)
(define-generic surface)
(define-generic imager)
(define-generic atmosphere)
(define-generic exterior)
(define-generic interior)
(define-generic displacement)
(define-generic basis)
(define-generic trim-curve)
(define-generic identifier)
;
; Primitives)
(define-generic cone)
(define-generic cylinder)
(define-generic disk)
(define-generic hyperboloid)
(define-generic paraboloid)
(define-generic sphere)
(define-generic torus)
(define-generic polygon)
(define-generic points-polygons)
(define-generic general-polygon)
(define-generic points-general-polygons)
(define-generic patch)
(define-generic patch-mesh)
(define-generic nu-patch)
(define-generic subdivision-mesh)
(define-generic curves)
(define-generic points)
(define-generic object-instance)

