extends Control

func _on_salir_si_pressed():
	get_tree().quit()

func _on_salir_no_pressed():
	self.visible = false
