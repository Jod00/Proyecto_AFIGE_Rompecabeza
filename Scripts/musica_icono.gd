extends Button

var bus_musica = AudioServer.get_bus_index("Master")
var icono_musica_on = preload("res://Imagenes/Iconos/musica.png")
var icono_musica_off = preload("res://Imagenes/Iconos/musica_no.png")
var estado = true

func _on_pressed():
	AudioServer.set_bus_mute(bus_musica, not AudioServer.is_bus_mute(bus_musica))
	if (estado == true):
		estado = false
		set_button_icon(icono_musica_off)
		set_tooltip_text("REPRODUCIR MÚSICA DE FONDO")
	else:
		estado = true
		set_button_icon(icono_musica_on)
		set_tooltip_text("PAUSAR MÚSICA DE FONDO")
