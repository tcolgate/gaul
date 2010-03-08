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
(use-modules (oop goops))

(define-class <engine-base> '())


(define-generic 

; State manipulation
;
description
render-begin
render-end
render-frame
camera
attribute-begin
attribute-end
transform-begin
transform-end
solid-begin
solid-end
motion-blur-begin
motion-blur-end
motion-blur
object-begin
object-end
translate
scale
skew
rotate
transform
concat-transform
projection
deformation
light-source
area-light-source
illuminate
color
opacity
surface
atmosphere
exterior
interior
displacement
basis
trim-curve
identifier

; Primitives
cone
cylinder
disk
hyperboloid
paraboloid
sphere
torus
polygon
points-polygons
general-polygon
points-general-polygons
patch
patch-mesh
nu-patch
curves
points
object-instance
imager


