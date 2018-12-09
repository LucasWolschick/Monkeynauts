
Namespace AST

'origins are at top left
Class Actor Abstract
  Protected
	Field position:Vec2f
	
	Field velocity:Vec2f
	Field rotation:Float
	
	Field size:Vec2f
	Field collision:Rectf
  Public
	Method New(initPos:Vec2f, initVel:Vec2f, size:Vec2f)
		position = initPos
		velocity = initVel
		Self.size = size
		rotation = 0
		
		collision = New Rectf(initPos,initPos+size)
	End
	
	Property Position:Vec2f()
		Return position
	Setter(pos:Vec2f)
		position = pos
	End
	
	Property Velocity:Vec2f()
		Return velocity
	Setter(vel:Vec2f)
		velocity = vel
	End
	
	Property Rotation:Float()
		Return rotation
	Setter(rot:Float)
		rotation = rot
	End
	
	Method Update() Virtual
		Local x:= position.x + velocity.x
		Local y:= position.y + velocity.y
		If x > Asteroids.W_WIDTH Then
			x = Asteroids.W_WIDTH - x - size.x + 1 'this fine?
		Elseif x < -size.x Then
			x = Asteroids.W_WIDTH + x + size.x - 1 'avoid reentrancy
		End
		
		If y > Asteroids.W_HEIGHT Then
			y = Asteroids.W_HEIGHT - y - size.y + 1
		Elseif y < -size.y Then
			y = Asteroids.W_HEIGHT + y + size.y - 1
		End
		
		position = New Vec2f(x,y)
		collision = New Rectf(position, position+size)
	End
	
	Method Render(canvas:Canvas) Abstract
	
	Method RenderHitboxes(canvas:Canvas)
		canvas.Color = Color.Red
		canvas.PointSize = 3
		canvas.DrawPoint(position)
			
		canvas.Color = Color.None
		canvas.OutlineColor = Color.Red
		canvas.OutlineMode = OutlineMode.Solid
		canvas.DrawRect(collision)
		
		canvas.OutlineMode = OutlineMode.None
	End
End
