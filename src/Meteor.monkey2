
Namespace AST


Class Meteor Extends Actor
	
	Field rotRate:Float
	Field radius:Float
	Field variations:Float[]
	Field vertexCount:Int
	
	Method New( initPos:Vec2f,initVel:Vec2f,radius:Float) Override
		Super.New(initPos, initVel, New Vec2f(radius*SQRT_TWO))
		rotRate = Rnd(-1.0, 1.0)*0.1
		Self.radius = radius
		
		variations = New Float[Int(6+Rnd()*2)]
		For Local i:=0 Until variations.Length
			variations[i] = 1+(Rnd()*-0.25)
		End
	End
	
	Method Update() Override
		Super.Update()
		'rotate it slightly
		rotation = (rotation + rotRate) Mod (2*Pi)
	End
	
	Method Render(canvas:Canvas) Override
		Local vertexes:= New Float[variations.Length*2]
		
		For Local i:=0 Until variations.Length
			Local offset:= (i/(variations.Length-1.0)) * Pi * 2 + variations[i]/5
			vertexes[(i*2)] = Sin(rotation + offset)*radius*variations[i]+position.x+size.x/2
			vertexes[(i*2)+1] = Cos(rotation + offset)*radius*variations[i]+position.y+size.y/2
		End
		
		canvas.Color = Color.DarkGrey
		canvas.DrawPoly(vertexes)
	End
	
End
