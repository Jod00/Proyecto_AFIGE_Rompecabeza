extends Node2D

# Declare member variables here. Examples:
# var a = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	Inicializando_piezas()
	Inicializando_espacio_piezas()

func Inicializando_espacio_piezas():
	$TrianguloRecIzq/CollisionPolygon2D.rotate(-92)
	$TrianguloRecIzq/CollisionPolygon2D.position.x -= 20
	$TrianguloRecIzq/CollisionPolygon2D.position.y += 30
	$TrianguloRecDer/CollisionPolygon2D.rotate(92)
	$TrianguloRecDer/CollisionPolygon2D.position.x += 10
	$TrianguloRecDer/CollisionPolygon2D.position.y +=30
	$rectangulo/CollisionShape2D.scale.x = 0.5
	$rectangulo/CollisionShape2D.position.x += 30
	
func Inicializando_piezas():
	$pieza_Rectangulo/AnimatedSprite.animation = "rectangulo"
	$pieza_Rectangulo/CollisionShape2D.scale.x = 0.5
	$pieza_trianguloRecDer/AnimatedSprite.animation = "TrianguloRectanguloDer"
	$pieza_trianguloRecDer/CollisionShape2D.position.x -= 30
	$pieza_trianguloRecIzq/AnimatedSprite.animation = "TrianguloRectanguloIzq"

func RompecabezasCompletado():
	pass

func pieza_Cuadrado_piezaArmada():
	$pieza_Cuadrado.position = $cuadrado.position
	$pieza_Cuadrado/CollisionShape2D.set_deferred("disabled",true)
	$cuadrado.queue_free()
