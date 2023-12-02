extends Button
# Variable para almacenar el tiempo anterior
var previous_time:int = 0

# Definiendo cuántos milisegundos deben pasar antes de que la función pueda ejecutarse nuevamente
const TIME_INTERVAL:int = 1 # 5000 ms o 5 segundos
var actual_action = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

 

func string_time_to_seconds(time_string: String) -> int:
	var parts = time_string.split(":")
	if parts.size() != 3:
		return 0.0

	var hours = float(parts[0])
	var minutes = float(parts[1])
	var seconds = float(parts[2])

	return hours * 3600 + minutes * 60 + seconds

func _on_button_up():
	var current_time_string = string_time_to_seconds(Time.get_time_string_from_system()) # Asumiendo que este es tu método
	
	if (int(current_time_string) - int(previous_time)) > TIME_INTERVAL:
		previous_time=current_time_string
		# Aquí va el contenido de tu función
   
		var audio = get_node("/root/level1/action")
		audio.play()
		if(actual_action == 0):
			get_node("/root/level1/toctoc").play()
			# Acceder al Panel colgando de Root (o tu nodo raíz)
			var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

			# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
			# var panel = $../Panel

			# Acceder al RichTextLabel y TextureRect que están dentro del Panel
			var rich_text = panel.get_node("RichTextLabel")
			var texture_rect = panel.get_node("TextureRect4")

			# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
			rich_text.text = "Toc Toc"
			texture_rect.texture = preload("res://images/avatars/cartero.png")
			actual_action = 1
		elif(actual_action == 1):
			#get_node("/root/level1/toctoc").play()
			# Acceder al Panel colgando de Root (o tu nodo raíz)
			var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

			# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
			# var panel = $../Panel

			# Acceder al RichTextLabel y TextureRect que están dentro del Panel
			var rich_text = panel.get_node("RichTextLabel")
			var texture_rect = panel.get_node("TextureRect4")

			# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
			rich_text.text = "Ya vaaaaa!!!"
			texture_rect.texture = preload("res://images/avatars/prota2.png")
			actual_action = 2
			
		elif(actual_action == 2):
				get_node("/root/level1/toctoc").play()
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				var texture_rect = panel.get_node("TextureRect4")

				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				rich_text.text = "TOC TOC!!!"
				texture_rect.texture = preload("res://images/avatars/cartero.png")
				actual_action = 3
		elif(actual_action == 3):
				
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				var texture_rect = panel.get_node("TextureRect4")

				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				rich_text.text = "No puede uno ni terminar una partida de civilization tranquilo..."
				texture_rect.texture = preload("res://images/avatars/prota.png")
				actual_action = 4
		elif(actual_action == 4):
				
				get_node("/root/level1/toctoc").play()
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "Toc toc..."
				var texture_background = get_node("/root/level1/TextureRect2")
				texture_background.visible = true
				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				var texture_rect = panel.get_node("TextureRect4")
				texture_rect.texture = preload("res://images/avatars/cartero.png")
				actual_action = 5
		elif(actual_action == 5):
				
				#get_node("/root/level1/toctoc").play()
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "¡Que ya vaaaaa!!!"
				var texture_background = get_node("/root/level1/TextureRect3")
				texture_background.visible = true
				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				var texture_rect = panel.get_node("TextureRect4")
				texture_rect.texture = preload("res://images/avatars/prota.png")
				actual_action = 6
		elif(actual_action == 6):
				
				get_node("/root/level1/toctoc").play()
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "No debe estar en casa, dejaré el aviso por la puerta, certificado? mmm... Si"
				var texture_background = get_node("/root/level1/TextureRect4")
				texture_background.visible = true
				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				var texture_rect = panel.get_node("TextureRect4")
				texture_rect.texture = preload("res://images/avatars/cartero.png")
				actual_action = 7
		elif(actual_action == 7):
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "Hola..."
				var texture_background1 = get_node("/root/level1/TextureRect4")
				var texture_background2 = get_node("/root/level1/TextureRect3")
				var texture_background3 = get_node("/root/level1/TextureRect2")
				texture_background1.visible = false 
				texture_background2.visible = false
				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				var texture_rect = panel.get_node("TextureRect4")
				texture_rect.texture = preload("res://images/avatars/narrador.png")
				texture_background3.texture = preload("res://images/level1/tiempo.png")
				actual_action = 8
		elif(actual_action == 8):
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "Soy el narrador de esta historia..."
				actual_action = 9
		elif(actual_action == 9):
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "Todos sabeis lo que duran las partidas de civilization..."
				actual_action = 10
		elif(actual_action == 10):
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "Finalmente nuestro prota conquistó todo el mundo, y se digno a abrir la puerta, horas mas tarde..."
				actual_action = 11
		elif(actual_action == 11):
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "Hey una carta de hacienda! hacienda somos todos, seguro que son buenas noticias"
				
				var texture_background3 = get_node("/root/level1/TextureRect2")
				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				var texture_rect = panel.get_node("TextureRect4")
				texture_rect.texture = preload("res://images/avatars/prota2.png")
				texture_background3.texture = preload("res://images/level1/carta3.png")
				actual_action = 12
		elif(actual_action == 12):
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "Aqui dice que tengo 24 horas para notificar una notificacion en el departamento de notificaciones sencillas..."
				
				var texture_background3 = get_node("/root/level1/TextureRect2")
				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				var texture_rect = panel.get_node("TextureRect4")
				texture_rect.texture = preload("res://images/avatars/prota2.png")
				texture_background3.texture = preload("res://images/level1/carta3.png")
				actual_action = 13

		elif(actual_action == 13):
				get_node("/root/level1/ups").play()
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node("/root/level1/Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "O me llegará una multa de 10.000 euros!!!!"
				
				var texture_background3 = get_node("/root/level1/TextureRect2")
				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				var texture_rect = panel.get_node("TextureRect4")
				texture_rect.texture = preload("res://images/avatars/prota.png")
				texture_background3.texture = preload("res://images/level1/carta3.png")
				actual_action = 14
		elif(actual_action == 14):
			# Carga la nueva escena
			var main_node = get_node("/root/level1") 
			# Llamar a la función en el nodo principal
			main_node._on_tree_exiting()
			var new_scene_resource = preload("res://scenes/level2.tscn")
			var new_scene = new_scene_resource.instantiate()

			# Añade la nueva escena al árbol
			get_tree().root.add_child(new_scene)

			# Asegúrate de que la nueva escena está activa
			get_tree().current_scene = new_scene

			# Quita la escena actual
			queue_free()
		
		await audio.finished
		previous_time = current_time_string
				
				
