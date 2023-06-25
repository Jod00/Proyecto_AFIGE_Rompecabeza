extends Area2D

# variables here:
var arrastrando = false
var posicionToque = Vector2()
var estaArmado = false
signal piezaArmada

func _ready():
	set_process_input(false)

func pieza_Cuadrados_mouse_entered():
	if !estaArmado:
		set_process_input(true)

func pieza_Cuadrados_mouse_exited():
	set_process_input(false)

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			if get_viewport_rect().has_point(event.position):
				posicionToque= event.position 
				arrastrando = true
		else:
			position = event.position
			posicionToque = event.position
			arrastrando = false

func _process(_delta):
	if arrastrando:
		position = get_global_mouse_position()

func _on_pieza_Cuadrados_body_entered(_body):
	arrastrando = false
	emit_signal("piezaArmada")
	estaArmado=true
	set_process_input(false)

