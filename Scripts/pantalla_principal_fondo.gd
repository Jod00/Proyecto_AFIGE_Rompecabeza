extends ParallaxBackground

@export var velocidad = 30

func _process(delta):
	scroll_offset.x -= velocidad*delta 
