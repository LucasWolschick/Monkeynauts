
Namespace AST

#Import "<std>"
#Import "<mojo>"

Using std..
Using mojo..

'maths
Function ToDegs:Float(rad:Float)
	Return rad * 180.0/Pi
End

Function ToRads:Float(deg:Float)
	Return deg * Pi/180.0
End

'consts
Global ORIGIN:Vec2f = New Vec2f(0)
Global SQRT_TWO:Double = Sqrt(2.0)

#Import "src/Asteroids"
#Import "src/Actor"
#Import "src/Player"
#Import "src/Meteor"