extends Button


var root = "/root/level3/"
var action = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	var scene_name = self.get_name()
	print(get_tree().current_scene.name)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_up():
	print("test")
	get_node("/root/level3/action").play()
	if action == 0:
		var panel = get_node(root+"Panel")
		var rich_text = panel.get_node("RichTextLabel")
		var texture_rect = panel.get_node("TextureRect4")

		# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
		rich_text.text = "Nuestro protagonista recorria madrid con la esperanza de encontrar pronto al primer funcionario..."
		texture_rect.texture = preload("res://images/avatars/narrador.png") 
		action = action +1
	elif action == 1:
		var background6 = get_node(root+"TextureCalles")
		background6.visible = false
		var background5 = get_node(root+"TextureNarrador")
		background5.visible = true
		var panel = get_node(root+"Panel")
		var rich_text = panel.get_node("RichTextLabel")
		var texture_rect = panel.get_node("TextureRect4")
		rich_text.text = "Entonces, por unos instantes, el dia se volvió noche, y un rayo calló en el centro de la calle, todo el mundo desapareció y un portal surgio de la nada \nSolo la silueta de un misterioso y atractivo galán era reconocible..."
		texture_rect.texture = preload("res://images/avatars/narrador.png") 
		action = action +1
	
	elif action == 2:
		var panel = get_node(root+"Panel")
		var rich_text = panel.get_node("RichTextLabel")
		var texture_rect = panel.get_node("TextureRect4")
		rich_text.text = "¿¡Qué...?!  ¿¡Qué es ese portal?! ¿¡Quién eres tú?! ¿¡Porque hablas de ti mismo en tercera persona?!"
		texture_rect.texture = preload("res://images/avatars/prota2.png") 
		action = action +1
	elif action == 3:
		var panel = get_node(root+"Panel")
		var rich_text = panel.get_node("RichTextLabel")
		var texture_rect = panel.get_node("TextureRect4")
		rich_text.text = "No hay tiempo para preguntas, estoy aqui para contar tu historia, soy el narrador, y te ayudaré a encontrar a los funcionarios."
		texture_rect.texture = preload("res://images/avatars/narrador.png") 
		action = action +1
		
	elif action == 4:
		var panel = get_node(root+"Panel")
		var rich_text = panel.get_node("RichTextLabel")
		var texture_rect = panel.get_node("TextureRect4")
		rich_text.text = "¿¡El narrador...?!  ¿¡Estoy en el show de truman?! ¡¿Y si me pongo a correr hasta llegar al final de este plato?!"
		texture_rect.texture = preload("res://images/avatars/prota2.png") 
		action = action +1
	elif action == 5:
		var panel = get_node(root+"Panel")
		var rich_text = panel.get_node("RichTextLabel")
		var texture_rect = panel.get_node("TextureRect4")
		rich_text.text = "Sabes tan bien como yo que no llegarias mas allá de dos calles, tu forma fisica es lamentable, y no, esto no es el show de truman."
		texture_rect.texture = preload("res://images/avatars/narrador.png") 
		action = action +1
		
	elif action == 6:
		var panel = get_node(root+"Panel")
		var rich_text = panel.get_node("RichTextLabel")
		var texture_rect = panel.get_node("TextureRect4")
		rich_text.text = "¡Mi forma fisica no es tan mala! Además la tortuga puede llegar a vencer a la liebre, no os dará tiempo a ampliar el escenario de manera infinita."
		texture_rect.texture = preload("res://images/avatars/prota.png") 
		action = action +1
			
	elif action == 6:
		var panel = get_node(root+"Panel")
		var rich_text = panel.get_node("RichTextLabel")
		var texture_rect = panel.get_node("TextureRect4")
		rich_text.text = "¿Te arriesgarias a abandonar la aventura y tener que pagar 10.000 euros de multa?"
		
		texture_rect.texture = preload("res://images/avatars/narrador.png") 
		action = action +1
			
	elif action == 7:
		var panel = get_node(root+"Panel")
		var rich_text = panel.get_node("RichTextLabel")
		var texture_rect = panel.get_node("TextureRect4")
		rich_text.text = "Está bien, resolveremos primero la aventura, ¿pero... quien eres?"
		
		texture_rect.texture = preload("res://images/avatars/prota2.png") 
		action = action +1		
	
	elif action == 8:
		var panel = get_node(root+"Panel")
		var rich_text = panel.get_node("RichTextLabel")
		var texture_rect = panel.get_node("TextureRect4")
		rich_text.text = "Soy el Narrador de esta historia, un mago omnipotente y... ¡un gran fan de los cómics! \nNo sabes cuánto esperaba este evento. Pero tranquilo, aquí nadie te está grabando... que yo sepa."
		
		texture_rect.texture = preload("res://images/avatars/narrador.png") 
		action = action +1

	elif action == 9: 
		var background5 = get_node(root+"TextureNarrador")
		background5.visible = false 
		var referencia = get_node("/root/level3")
		self.visible = false
		referencia.toggle_full_screen_button(true)
		referencia.narrador()
		action = action +1
		
	
	pass # Replace with function body.

