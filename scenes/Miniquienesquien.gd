extends Control
var last_mouse_position: Vector2 = Vector2()
var time_since_last_move: float = 0.0
var is_mouse_stopped: bool = false
var stop_threshold: float = 1  # 2 milisegundos
var path_de_la_textura = ""
var position_to_show_text: Vector2 = Vector2()
var texture_button_mouse_control : TextureButton
func processButton(button): 
	pass
# Called when the node enters the scene tree for the first time.

func init():
	var contenedor = get_node("ContenedorDeTarjetas")

	# Asegurarse de que el nodo contenedor existe
	if contenedor:
		for button in contenedor.get_children():
			# Comprobar si el hijo es un TextureButton
			if button is TextureButton:
				# Crear un Callable directamente para la función objetivo con el botón como argumento
				var callable = Callable(self, "_on_mouse_entered").bind(button)
				# Conectar la señal 'mouse_entered' al Callable
				button.connect("mouse_entered", callable)
				var callable2 = Callable(self, "_on_mouse_exit")
				button.connect("mouse_exited", callable2)
				var callable3 = Callable(self, "_on_button_down").bind(button)
				button.connect("button_down", callable3)

func _ready():
	init()
	last_mouse_position = get_viewport().get_mouse_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current_mouse_position = get_viewport().get_mouse_position()
	print("check")
	if current_mouse_position != last_mouse_position:
		print("posicion diferente")
		is_mouse_stopped = false
		time_since_last_move = 0.0
		last_mouse_position = current_mouse_position
	else:
		time_since_last_move += delta
		if time_since_last_move >= stop_threshold:
			print("pinta")
			is_mouse_stopped = true
			# Cargar la textura desde el path
			print(position_to_show_text)
			print(current_mouse_position)
			if path_de_la_textura != "" && texture_button_mouse_control.get_rect().has_point(current_mouse_position):
				var nueva_textura = load(path_de_la_textura)

				# Asignar la textura al nuevo nodo
				var node = get_node("ImagenAmpliada")


				# Asigna la nueva textura al nodo TextureRect 
				node.texture = nueva_textura
				#node.texture.sca(Vector2(nueva_textura.get_width() * 0.5, nueva_textura.get_height() * 0.5))
				node.visible = true
				# Comienza el temporizador para ocultar la imagen después de 2 segundos
				get_node("Timer").start()


func _on_mouse_entered(texturebutton : TextureButton):
	print(texturebutton.name)
	texture_button_mouse_control = texturebutton
	
	var textura_a = texturebutton.texture_normal
	
	# Obtener la ruta de la textura
	path_de_la_textura = textura_a.resource_path
	
	position_to_show_text = get_viewport().get_mouse_position()

 

var princesas:Array = ["char6L7","char5L7", "char5L3", "char1L6"]
var elfos:Array = ["char2L5","char8L3", "char6L2", "char1L1","char3L7"]
var ninjas:Array = ["char9L6","char2L7", "char8L4", "char7L4", "char6L4", "char3L4", "char2L4", 
"char8L2", "char8L1", "char3L1", "char9L2"]
var potters:Array = ["char6L5","char7L5", "char9L5"]
var mcain:Array = ["char2L2","char2L3", "char5L2", "char7L2", "char4L3", "char5L4", "char4L6"]
var fantasia:Array = ["char4L1","char9L3", "char4L4", "char3L5", "char4L5", "char2L6", "char3L6", "char5L6", "char7L7"]
var neo:Array = ["char9L1","char1L3"]
var extraterrestres:Array = ["char1L7","char4L7","char5L1","char6L1","char4L2"]
func _on_button_up():
	var node = get_node("ImagenAmpliada")
	node.visible = false
	
	
func check_by_level(texturebutton: TextureButton, items: Array):
	if texturebutton.name in items:
		get_node("/root/Miniquienesquien/NarradorSi").play()  
		texturebutton.visible = false
				
		var index = items.find(texturebutton.name)
		#for item in items:
		#	print(item)
		if index != -1:
			items.remove_at(index)
		#print(items.size())
		if items.size() == 0:
			var node = get_node("/root/Miniquienesquien/narradorButton")
			node.isActive = true
			node.visible = true
			node.nextText()
	else:
		get_node("/root/Miniquienesquien/NarradorNo").play()
	
func _on_button_down(texturebutton : TextureButton):
	path_de_la_textura = ""
	if getLevel() == 1:
		check_by_level(texturebutton, princesas)
	elif getLevel() == 2:
		check_by_level(texturebutton, elfos)
	elif getLevel() == 3:
		check_by_level(texturebutton, ninjas)
	elif getLevel() == 4:
		check_by_level(texturebutton, potters)
	elif getLevel() == 5:
		check_by_level(texturebutton, mcain)
	elif getLevel() == 6:
		check_by_level(texturebutton, fantasia)
	elif getLevel() == 7:
		check_by_level(texturebutton, neo)
	elif getLevel() == 8:
		check_by_level(texturebutton, extraterrestres)
	
	
func _on_mouse_exit():
	var node = get_node("ImagenAmpliada")
	node.visible=false


func getLevel():
	var level = GlobalVariables.level
	return level


func _on_timer_timeout():
	var node = get_node("ImagenAmpliada")
	node.visible = false
