extends Node2D

var FormaTrianguloRect = []

#var b = false

func _ready():
	FormaTrianguloRect = [Vector2(0,-38),Vector2(0,38),Vector2(-60,38)]
	#$titulopantalla.text= str($rectangulo/CollisionShape2D.transform)
	##Modificacion de las piezas
	$pieza_trianguloRecIzq/AnimatedSprite.animation = 'TrianguloRectanguloIzq'
	$pieza_trianguloRecDer/AnimatedSprite.animation = "TrianguloRectanguloDer"
	$pieza_Rectangulo/AnimatedSprite.animation = "rectangulo"
	$pieza_Rectangulo/CollisionShape2D.scale.x = 0.5
	##Modificacion de los espacios para las peizas o simplemente(espacios)
	$rectangulo/CollisionShape2D.scale.x = 0.3
	$rectangulo/CollisionShape2D.position.x += 18
	#void set ( int idx, Vector2 vector2 )
#	$TrianguloRecDer/CollisionPolygon2D.polygon.set(1,Vector2(0,38))
	$TrianguloRecDer/CollisionPolygon2D.scale = Vector2(0.7,0.7)
	$TrianguloRecIzq/CollisionPolygon2D.polygon.set(1,Vector2(30,38))
	#$TrianguloRecIzq/CollisionPolygon2D

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass