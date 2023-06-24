extends Node2D

var cantidad_piezas = 5
var avisoCompletado = false

func _ready():
	Inicializando_piezas()
	Inicializando_espacio_piezas()

func Inicializando_espacio_piezas():
	$TrianguloRecIzq/CollisionPolygon2D.rotate(-92)
	$TrianguloRecIzq/CollisionPolygon2D.position.x -= 20
	$TrianguloRecIzq/CollisionPolygon2D.position.y += 30
	$TrianguloRecDer/AnimatedSprite.animation= "trianguloRectanguloDer"
	$TrianguloRecDer.position = $TrianguloRecDer.position + Vector2(32,-3) 
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
	print("aa")

func pieza_trianguloRecIzq_piezaArmada():
	$pieza_trianguloRecIzq.position = Vector2(278,348)
	$TrianguloRecIzq.queue_free()
	$pieza_trianguloRecIzq/CollisionShape2D.set_deferred("disabled",true)
	cantidad_piezas -=1

func pieza_trianguloRecDer_piezaArmada():
	$pieza_trianguloRecDer.position = Vector2(576,348)
	$TrianguloRecDer.queue_free()
	$pieza_trianguloRecDer/CollisionShape2D.set_deferred("disabled",true)
	cantidad_piezas -=1

func pieza_triangulo_piezaArmada():
	$pieza_triangulo.position = Vector2(427,218)
	$pieza_triangulo/CollisionShape2D.set_deferred("disabled",true)
	$Triangulos.queue_free()
	cantidad_piezas -=1

func pieza_Rectangulo_piezaArmada():
	$pieza_Rectangulo.position = Vector2(492,348)
	$rectangulo.queue_free()
	$pieza_Rectangulo/CollisionShape2D.set_deferred("disabled",true)
	cantidad_piezas -=1

func pieza_Cuadrado_piezaArmada():
	$pieza_Cuadrado.position = Vector2(395,348)
	$pieza_Cuadrado/CollisionShape2D.set_deferred("disabled",true)
	$cuadrado.queue_free()
	cantidad_piezas -=1

func _process(_delta): # esta funcion permite detectar cambios dentro del juego
	if cantidad_piezas ==0 and !avisoCompletado:
		RompecabezasCompletado()
		avisoCompletado = true

func botonRegresar_pressed():
	pass
