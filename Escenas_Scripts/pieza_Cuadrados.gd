extends Area2D

# variables here:
var arrastrando = false
var posicionToque = Vector2()
var estaArmado = false
signal tocando

func _ready():
	set_process_input(false)

func pieza_Cuadrados_mouse_entered():
	emit_signal("tocando")
	#set_process_input(true)

func pieza_Cuadrados_mouse_exited():
	pass#set_process_input(false)

#func in
func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			if get_viewport_rect().has_point(event.position):
				posicionToque= event.position 
				arrastrando = true
		else:
			position = event.position
			arrastrando = false

func _process(_delta):
	if arrastrando:
		position = get_global_mouse_position()
	
## para la colision , para que funcione de neuvo solo cambiar false por true
#set_process_input(false) # detiene la funcion input 






