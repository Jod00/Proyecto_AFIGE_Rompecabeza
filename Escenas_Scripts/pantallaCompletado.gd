extends CanvasLayer

func _ready():
	$tituloFiguraGeometrica.hide()
	$botonContinuar.hide()
	$tiempoLogrado.hide()
	$cartelFelicitacion.hide()
#	$gatoProfesor.hide()

#func _process(delta):
#	pass

func MostrarEscenaCompletado():
	$tituloFiguraGeometrica.show()
	$botonContinuar.show()
	$tiempoLogrado.show()
	$cartelFelicitacion.show()
#	$gatoProfesor.show()

func PuntajeLogrado(tiempo):
	$tiempoLogrado.text += tiempo

func botonContinuar_pressed():
	yield(get_tree().create_timer(1),"timeout") # hará que espere 1s para ver animacion

func tituloFiguraGeometrica(nombre):
	$tituloFiguraGeometrica.text = "¡ "+nombre+" !"
