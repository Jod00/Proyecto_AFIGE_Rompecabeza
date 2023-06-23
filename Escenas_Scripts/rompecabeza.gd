extends Node2D

#export (PackedScene) var bomba
#export (PackedScene) var piezaCuadrada
var FormaTrianguloRect = []

func _ready():
	FormaTrianguloRect = [Vector2(0,-38),Vector2(0,38),Vector2(-60,38)]
	$tituloPantalla.text= "lala"
	##Modificacion de las piezas
	$pieza_trianguloRecIzq/AnimatedSprite.animation = 'TrianguloRectanguloIzq'
	$pieza_trianguloRecDer/AnimatedSprite.animation = "TrianguloRectanguloDer"
	$pieza_Rectangulo/AnimatedSprite.animation = "rectangulo"
	$pieza_Rectangulo/CollisionShape2D.scale.x = 0.5
	
	##Modificacion de los espacios para las piezas o simplemente(espacios)
	$rectangulo/CollisionShape2D.scale.x = 0.3
	$rectangulo/CollisionShape2D.position.x += 18
	#void set ( int idx, Vector2 vector2 )
#	$TrianguloRecDer/CollisionPolygon2D.polygon.set(1,Vector2(0,38))
	$TrianguloRecDer/CollisionPolygon2D.scale = Vector2(0.7,0.7)
	$TrianguloRecIzq/CollisionPolygon2D.polygon.set(1,Vector2(30,38))
	#$TrianguloRecIzq/CollisionPolygon2D

## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pieza_Cuadrado_tocando():
	$tituloPantalla.text= "no "
	



func _on_botonRegresar_pressed():
	$tituloPantalla.text= "si "
