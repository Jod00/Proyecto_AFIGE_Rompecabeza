extends Node2D


@onready var cantidad_preguntas = $numero_preguntas_daltonismo
@onready var imagen = $lamina_prueba
@onready var opcion1 = $opcion1_daltonismo
@onready var opcion2 = $opcion2_daltonismo
@onready var opcion3 = $opcion3_daltonismo


var arreglo_preguntas : Array = leer_archivo_json("res://Jsons/preguntas_prueba_daltonismo.json")
var data : Dictionary
var indice_data : int = 0
var arreglo_respuestas : Array = []
var punto_anterior : int = 0
var puntos : int = 0
var arreglo_puntos : Array = []


func _ready():
	refrescar_escena()


func refrescar_escena():
	if indice_data >= arreglo_preguntas.size():
		modificar_paleta_colores()
	else:
		mostrar_preguntas()


func mostrar_preguntas():
	gestionar_boton_anterior()
	gestionar_boton_siguiente()
	
	cantidad_preguntas.set_text(str(indice_data+1)+" / "+str(arreglo_preguntas.size()))
	
	data = arreglo_preguntas[indice_data]
	imagen.texture = load(data.lamina)
	opcion1.set_text(data.opciones[0])
	opcion2.set_text(data.opciones[1])
	opcion3.set_text(data.opciones[2])


func almacenar_respuestas(posicion_arreglo, respuesta_seleccionada, indice_puntaje):
	data = arreglo_preguntas[posicion_arreglo]
	#arreglo_puntos += int(data.puntajes[indice_puntaje])
	if ((posicion_arreglo+1) > arreglo_respuestas.size()):
		arreglo_respuestas.append(respuesta_seleccionada)
		puntos += int(data.puntajes[indice_puntaje])
		arreglo_puntos.append(data.puntajes[indice_puntaje])
		print("entro en el append")
	else:
		arreglo_respuestas.pop_at(posicion_arreglo)
		puntos -= punto_anterior
		arreglo_respuestas.insert(posicion_arreglo, respuesta_seleccionada)
		puntos += int(data.puntajes[indice_puntaje])
		
		arreglo_puntos.pop_at(posicion_arreglo)
		arreglo_puntos.insert(posicion_arreglo, data.puntajes[indice_puntaje])
		print("entro en el insert")
	
	print("indice data vale: " +str(indice_data))
	print(arreglo_respuestas)
	print(arreglo_puntos)
	
	punto_anterior = int(data.puntajes[indice_puntaje])
	print("el punto anterior es: "+str(punto_anterior))
	print("la suma de puntos da: "+str(puntos))
	indice_data += 1


func _on_opcion_1_daltonismo_pressed():
	almacenar_respuestas(indice_data, opcion1.get_text(), 0)
	refrescar_escena()


func _on_opcion_2_daltonismo_pressed():
	almacenar_respuestas(indice_data, opcion2.get_text(), 1)
	refrescar_escena()


func _on_opcion_3_daltonismo_pressed():
	almacenar_respuestas(indice_data, opcion3.get_text(), 2)
	refrescar_escena()


func _on_pregunta_anterior_icono_pressed():
	indice_data -= 1
	print("indice data vale: " +str(indice_data))
	mostrar_preguntas()


func _on_pregunta_siguiente_icono_pressed():
	indice_data += 1
	print("indice data vale: " +str(indice_data))
	mostrar_preguntas()


func gestionar_boton_anterior():
	if (indice_data == 0):
		$pregunta_anterior_icono.disabled = true
	else:
		$pregunta_anterior_icono.disabled = false


func gestionar_boton_siguiente():
	if ((indice_data == 11) or (indice_data >= arreglo_respuestas.size())):
		$pregunta_siguiente_icono.disabled = true
	else:
		$pregunta_siguiente_icono.disabled = false


func leer_archivo_json(nombre_archivo):
	var archivo = FileAccess.open(nombre_archivo, FileAccess.READ)
	var texto = archivo.get_as_text()
	var json_data = JSON.parse_string(texto)
	return json_data


func modificar_paleta_colores():
	PantallaTransicion.cambiar_escena("res://Escenas/pantalla_principal.tscn")
