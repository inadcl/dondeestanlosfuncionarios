extends Button 
# Variable para almacenar el tiempo anterior
var previous_time:int = 0
var root = "/root/level2/"
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
   
		var audio = get_node(root+"action")
		audio.play()
		
		if(actual_action == 0):
			#get_node(root+"toctoc").play()
			# Acceder al Panel colgando de Root (o tu nodo raíz)
			var panel = get_node(root+"Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

			# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
			# var panel = $../Panel

			# Acceder al RichTextLabel y TextureRect que están dentro del Panel
			var rich_text = panel.get_node("RichTextLabel")
			var texture_rect = panel.get_node("TextureRect4")

			# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
			
			rich_text.text = "De hecho, la última vez que salió fue para intentar encontrar una zona sin gente jugando al 'Pokémon GO'..."
			texture_rect.texture = preload("res://images/avatars/narrador.png")
			actual_action = 1
		elif(actual_action == 1):
			#get_node(root+"toctoc").play()
			# Acceder al Panel colgando de Root (o tu nodo raíz)
			var panel = get_node(root+"Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

			# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
			# var panel = $../Panel

			# Acceder al RichTextLabel y TextureRect que están dentro del Panel
			var rich_text = panel.get_node("RichTextLabel")
			var texture_rect = panel.get_node("TextureRect4")

			# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
			
			rich_text.text = "Nuestro protagonista parte sin demora al centro de tramites de notificaciones sencillas, donde..."
			texture_rect.texture = preload("res://images/avatars/narrador.png")
			actual_action = 2
		elif(actual_action == 2):
			#get_node("/root/level1/toctoc").play()
			# Acceder al Panel colgando de Root (o tu nodo raíz)
			var panel = get_node(root+"Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

			# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
			# var panel = $../Panel

			# Acceder al RichTextLabel y TextureRect que están dentro del Panel
			var rich_text = panel.get_node("RichTextLabel")
			var texture_rect = panel.get_node("TextureRect4")

			# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
			rich_text.text = "Marchaaaaaaando \nUna de calamares, los mejores calamares están en Madrid."
			texture_rect.texture = preload("res://images/avatars/camarero2.png")
			actual_action = 3
			
		elif(actual_action == 3):
				get_node(root+"mm").play()
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node(root+"Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				var texture_rect = panel.get_node("TextureRect4")

				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				rich_text.text = "Uy uy uy...\nComo me voy a poner!"
				texture_rect.texture = preload("res://images/avatars/narrador.png")
				actual_action = 4
		elif(actual_action == 4):
				
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node(root+"Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var texture_background = get_node(root+"TextureRect2")
				texture_background.visible = true
				var rich_text = panel.get_node("RichTextLabel")
				var texture_rect = panel.get_node("TextureRect4")

				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				rich_text.text = "¿¡Hola?! ¿Hay alguien aquí? \n¡Tengo un papelito que dice que me quieren reclamar 10.000 euros y preferiría que no fuera así!"
				texture_rect.texture = preload("res://images/avatars/prota.png")
				actual_action = 5
		elif(actual_action == 5):
				
				
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node(root+"Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "¿Hay alguien o esto es como el final de 'Lost' y me quedé esperando por nada?"
				var texture_background = get_node(root+"TextureRect3")
				texture_background.visible = true
				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				var texture_rect = panel.get_node("TextureRect4")
				texture_rect.texture = preload("res://images/avatars/prota2.png")
				actual_action = 6
		elif(actual_action == 6):
				
				#get_node("/root/level1/toctoc").play()
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node(root+"Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "Si este lugar estuviera más vacío, le llamarían 'Promesas políticas'. \nQuizás encuentre algo en los mostradores"
				var texture_background = get_node(root+"TextureRect4")
				texture_background.visible = true
				var cafe_button = get_node(root+"cafe")
				cafe_button.visible = true
				var poster_button = get_node(root+"poster")
				poster_button.visible = true
				var premio_button = get_node(root+"premio")
				premio_button.visible = true
				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				var texture_rect = panel.get_node("TextureRect4")
				texture_rect.texture = preload("res://images/avatars/prota.png")
				actual_action = 7
		elif(actual_action == 8):
				
				
				# Acceder al Panel colgando de Root (o tu nodo raíz)
				var panel = get_node(root+"Panel")  # Cambia 'NombreDeTuNodoRaíz' por el nombre de tu nodo raíz

				# O también puedes usar el operador '$' si el botón y el panel están en la misma escena
				# var panel = $../Panel

				# Acceder al RichTextLabel y TextureRect que están dentro del Panel
				var rich_text = panel.get_node("RichTextLabel")
				rich_text.text = "Esto me recuerda a esos videojuegos de antaño. Tres llaves, tres puertas... ¡y tres funcionarios a descubrir!"
				var texture_background = get_node(root+"TextureRect3")
				texture_background.visible = true
				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				var texture_rect = panel.get_node("TextureRect4")
				texture_rect.texture = preload("res://images/avatars/prota2.png")
				actual_action = 9
		elif(actual_action == 9):
			
			var main_node = get_node("/root/level2") 
			# Llamar a la función en el nodo principal
			main_node._on_tree_exiting()
			var new_scene_resource = preload("res://scenes/level3.tscn")
			var new_scene = new_scene_resource.instantiate()

			# Añade la nueva escena al árbol
			get_tree().root.add_child(new_scene)

			# Asegúrate de que la nueva escena está activa
			get_tree().current_scene = new_scene

			# Quita la escena actual
			queue_free()
						
		await audio.finished
		previous_time = current_time_string
				
				
func last_action():
	actual_action=8
