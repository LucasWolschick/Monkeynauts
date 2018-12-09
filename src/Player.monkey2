
Namespace AST

Class Player Extends Actor
	
	Global ROTATION_RATE:Float 	= 0.1
	Global SPEED_RATE:Float    	= 0.1
	Global MAX_SPEED:Float		= 6
	
	Method New( initPos:Vec2f,initVel:Vec2f) Override
		Super.New(initPos, initVel, New Vec2f(10,10))
	End
	
	Method Update() Override
		Super.Update()
		
		'rotation
		If Keyboard.KeyDown(Key.A) Or Keyboard.KeyDown(Key.Left) Then
			rotation += ROTATION_RATE
		Elseif Keyboard.KeyDown(Key.D) Or Keyboard.KeyDown(Key.Right) Then
			rotation += -ROTATION_RATE
		End
		
		rotation = rotation Mod (2*Pi)
		
		'thrust
		If Keyboard.KeyDown(Key.W) Or Keyboard.KeyDown(Key.Up) Then
			velocity += New Vec2f(Cos(-rotation), Sin(-rotation)) * SPEED_RATE
		End
		'no reverse LOL
		
		'limit speed
		If Sqrt((velocity.x)*(velocity.x) + (velocity.y)*(velocity.y)) > MAX_SPEED Then
			velocity = velocity.Normalize() * MAX_SPEED
		End
	End
	
	Method Render(canvas:Canvas) Override
		Local big_radius:=10.0
		Local small_radius:=big_radius/2.0
		
		'top vertex
		Local v1:= New Vec2f( Sin((0.50*Pi)+rotation)*big_radius, Cos((0.50*Pi)+rotation)*big_radius )
		'bottom right vertex
		Local v2:= New Vec2f( Sin((-0.25*Pi)+rotation)*big_radius, Cos((-0.25*Pi)+rotation)*big_radius )
		'bottom mid vertex 
		Local v3:= New Vec2f( Sin((1.5*Pi)+rotation)*small_radius, Cos((1.5*Pi)+rotation)*small_radius )
		'bottom left vertex 
		Local v4:= New Vec2f( Sin((1.25*Pi)+rotation)*big_radius, Cos((1.25*Pi)+rotation)*big_radius )
		
		Local offset:= position+size/2
		
		canvas.Color = Color.White
		canvas.DrawTriangle(v1+offset, v3+offset, v4+offset)
		canvas.Color = Color.LightGrey
		canvas.DrawTriangle(v1+offset, v2+offset, v3+offset)
	End
End
