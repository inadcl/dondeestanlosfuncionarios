extends Control

var isNarrador : bool = false
var selectedScene : String = ""
var root = "/root/level3/"
var isCafe = false
var isPremio = false
var isPoster = false
var action = 0
var previous_time:int = 0

# Definiendo cuántos milisegundos deben pasar antes de que la función pueda ejecutarse nuevamente
const TIME_INTERVAL:int = 1 # 5000 ms o 5 segundos


func string_time_to_seconds(time_string: String) -> int:
	var parts = time_string.split(":")
	if parts.size() != 3:
		return 0.0

	var hours = float(parts[0])
	var minutes = float(parts[1])
	var seconds = float(parts[2])

	return hours * 3600 + minutes * 60 + seconds
	
	
func _ready():
	$AudioStreamPlayer2D.play()


func _on_tree_exiting():
	$AudioStreamPlayer2D.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func vuelta():
	var premio = get_node(root+"premio")
	premio.visible = !isPremio
	var poster = get_node(root+"poster")
	poster.visible = !isPoster
	var cafe = get_node(root+"cafe")
	cafe.visible = !isCafe


func volveralevel3():
	if !isCafe:
		var cafe = get_node(root+"cafe")
		cafe.visible = true
	if !isPremio:
		var premio = get_node(root+"premio")
		premio.visible = true
	if !isPoster:
		var poster = get_node(root+"poster")
		poster.visible = true
	
	check_all_buttons()

	
func ocultarBotones():
		var premio = get_node(root+"premio")
		premio.visible = false
		var poster = get_node(root+"poster")
		poster.visible = false
		var cafe = get_node(root+"cafe")
		cafe.visible = false
	
	
func narrador():
	ocultarBotones()
	if isNarrador:
		print("narrador finished")
		var background5 = get_node(root+"TextureNarrador")
		background5.visible = false
		var background6 = get_node(root+"TextureCalles")
		background6.visible = false
		var narradorbutton = get_node(root+"ButtonNarrador")
		narradorbutton.visible = false
		if selectedScene == "cafe":
			cafe()
		elif selectedScene == "poster":
			poster()
		elif selectedScene == "premio":
			premio()
	else:
		isNarrador = true
		var background2 = get_node(root+"TextureCafe")
		background2.visible = false
		var background3 = get_node(root+"TextureComiccon")
		background3.visible = false
		var background4 = get_node(root+"Texturekaraoke")
		background4.visible = false
		var background5 = get_node(root+"TextureNarrador")
		background5.visible = true
		var background6 = get_node(root+"TextureCalles")
		background6.visible = true
		var narradorbutton = get_node(root+"ButtonNarrador")
		narradorbutton.visible = true
		var panel = get_node(root+"Panel")
		var rich_text = panel.get_node("RichTextLabel")
		var texture_rect = panel.get_node("TextureRect4")

		# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
		rich_text.text = "Nuestro protagonista recorria madrid con la esperanza de encontrar pronto al primer funcionario..."
		texture_rect.texture = preload("res://images/avatars/narrador.png") 
	
func toggle_full_screen_button(value):
	var full_screen_button = get_node(root).get_node("Buttonlevel3")
	full_screen_button.visible = value
	
func cafe():
	selectedScene="cafe"
	get_node("/root/level3/action").play()
	if !isNarrador:
		narrador()
	else:
		toggle_full_screen_button(true)
		var current_time_string = string_time_to_seconds(Time.get_time_string_from_system()) # Asumiendo que este es tu método
		
		if (int(current_time_string) - int(previous_time)) > TIME_INTERVAL:
			previous_time=current_time_string	
			if action == 0:
				isCafe = true
				var background2 = get_node(root+"TextureCafe")
				background2.visible = true
				var background3 = get_node(root+"TextureComiccon")
				background3.visible = false
				var background4 = get_node(root+"Texturekaraoke")
				background4.visible = false
				var panel = get_node(root+"Panel")
				var rich_text = panel.get_node("RichTextLabel")
				var texture_rect = panel.get_node("TextureRect4")

				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				rich_text.text = "Apostaría mi último euro a que el funcionario que busco está aquí, tomando un café tan pretencioso que ni siquiera el barista sabe lo que es."
				texture_rect.texture = preload("res://images/avatars/prota2.png") 
		
func premio():
	selectedScene="premio"
	get_node("/root/level3/action").play()
	if !isNarrador:
		narrador()
	else:
		toggle_full_screen_button(true)
		isPremio = true
		var current_time_string = string_time_to_seconds(Time.get_time_string_from_system()) # Asumiendo que este es tu método
		
		if (int(current_time_string) - int(previous_time)) > TIME_INTERVAL:
			previous_time=current_time_string	
			if action == 0:
				var background2 = get_node(root+"TextureCafe")
				background2.visible = false
				var background3 = get_node(root+"TextureComiccon")
				background3.visible = false
				var background4 = get_node(root+"Texturekaraoke")
				background4.visible = true
				var panel = get_node(root+"Panel")
				var rich_text = panel.get_node("RichTextLabel")
				var texture_rect = panel.get_node("TextureRect4")

				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				rich_text.text = "Si el funcionario que busco tiene tantos premios de karaoke como papeles pendientes, ¡seguro que es la estrella del show!"
				texture_rect.texture = preload("res://images/avatars/prota2.png") 
			
		
		
	
	
func poster():
	selectedScene="poster"
	get_node("/root/level3/action").play()
	if !isNarrador:
		narrador()
	else:
		toggle_full_screen_button(true)
		isPoster = true
		var current_time_string = string_time_to_seconds(Time.get_time_string_from_system()) # Asumiendo que este es tu método
		
		if (int(current_time_string) - int(previous_time)) > TIME_INTERVAL:
			previous_time=current_time_string	
			if action == 0:
				var background2 = get_node(root+"TextureCafe")
				background2.visible = false
				var background3 = get_node(root+"TextureComiccon")
				background3.visible = true
				var background4 = get_node(root+"Texturekaraoke")
				background4.visible = false
				
				var panel = get_node(root+"Panel")
				var rich_text = panel.get_node("RichTextLabel")
				var texture_rect = panel.get_node("TextureRect4")

				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				rich_text.text = "Y pensé que mi vestuario de todos los días era original. ¡Parece que soy el único sin capa aquí!\n¿Quizás el funcionario esté dando una conferencia sobre burocracia interestelar?"
				texture_rect.texture = preload("res://images/avatars/prota2.png")
				action = action +1
			
			elif action == 1: 
				
				var panel = get_node(root+"Panel")
				var rich_text = panel.get_node("RichTextLabel")
				var texture_rect = panel.get_node("TextureRect4")

				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				rich_text.text = "Encontrar al funcionario, tu destino es. ¿Listo para el viaje estás?"
				texture_rect.texture = preload("res://images/avatars/narrador.png")

				action = action +1
			elif action == 2: 
				
				var panel = get_node(root+"Panel")
				var rich_text = panel.get_node("RichTextLabel")
				var texture_rect = panel.get_node("TextureRect4")

				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				rich_text.text = "Oye, prefiero que hables como Gandalf si vamos a meternos en roles. Al menos él hablaba claro."
				texture_rect.texture = preload("res://images/avatars/prota2.png")

				action = action +1
			elif action == 3: 
				
				var panel = get_node(root+"Panel")
				var rich_text = panel.get_node("RichTextLabel")
				var texture_rect = panel.get_node("TextureRect4")

				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				rich_text.text = "¡Ja, ja! Muy bien, que la claridad sea nuestro camino. Sigamos adelante entonces."
				texture_rect.texture = preload("res://images/avatars/narrador.png")

				action = action +1
			elif action == 4: 
				
				var panel = get_node(root+"Panel")
				var rich_text = panel.get_node("RichTextLabel")
				var texture_rect = panel.get_node("TextureRect4")

				# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
				rich_text.text = "Eso suena mejor. ¡Vamos allá!"
				texture_rect.texture = preload("res://images/avatars/prota2.png")

				action = action +1
			elif action == 5:
				action = 0
				abrir_quienesquien()
				
		

func check_all_buttons():
	if (isCafe and isPoster and isPoster): 
		# Carga la nueva escena
		var main_node = get_node("/root/level4/Buttonlevel3") 
		# Llamar a la función en el nodo principal
		main_node.last_action()

func abrir_quienesquien():
	var next_scene = preload("res://scenes/Miniquienesquien.tscn")
	get_tree().change_scene_to_packed(next_scene)
