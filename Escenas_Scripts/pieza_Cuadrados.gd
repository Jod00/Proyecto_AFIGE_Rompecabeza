extends Area2D

# variables here:
var arrastrando = false
var posicionToque = Vector2()
var estaArmado = false

func _ready():
	pass # Replace with function body.

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
