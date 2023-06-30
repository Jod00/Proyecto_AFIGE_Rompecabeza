extends Node2D

@onready var salir_ventana = $salir_ventana


func _ready():
	salir_ventana.visible = false


func _on_salir_icono_pressed():
	salir_ventana.visible = true


func _on_informacion_icono_pressed():
	PantallaTransicion.cambiar_escena("res://Escenas/informacion_relevante.tscn")


func _on_paleta_colores_icono_pressed():
	PantallaTransicion.cambiar_escena("res://Escenas/paleta_colores.tscn")


func _on_jugar_boton_pressed():
	PantallaTransicion.cambiar_escena("res://Escenas/seleccion_figuras.tscn")
