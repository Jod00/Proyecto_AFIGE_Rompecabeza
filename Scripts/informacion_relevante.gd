extends Node2D


func _on_regresar_icono_pressed():
	PantallaTransicion.cambiar_escena("res://Escenas/pantalla_principal.tscn")


func _on_acerca_texto_meta_clicked(meta):
	OS.shell_open(meta)
