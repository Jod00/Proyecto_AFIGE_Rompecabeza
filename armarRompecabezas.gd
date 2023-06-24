extends Node2D

# Declare member variables here. Examples:
# var a = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	Inicializando_piezas()
	Inicializando_espacio_piezas()

func Inicializando_espacio_piezas():
	$rectangulo/CollisionShape2D.scale.x = 0.4
	$rectangulo/CollisionShape2D.position.x += 30

func Inicializando_piezas():
	$pieza_Rectangulo/AnimatedSprite.animation = "rectangulo"
	$pieza_Rectangulo/CollisionShape2D.scale.x = 0.5

func RompecabezasCompletado():
	pass

func pieza_Cuadrado_piezaArmada():
	$pieza_Cuadrado.position = $cuadrado.position
	$cuadrado.queue_free()
