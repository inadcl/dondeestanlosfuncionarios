extends Control


var root = "/root/level2/"
var isCafe = false
var isPremio = false
var isPoster = false

func _ready():
	$AudioStreamPlayer2D.play()


func _on_tree_exiting():
	$AudioStreamPlayer2D.stop() 



func _on_button_up_cafe():
	isCafe = true
	var panel = get_node(root+"Panel")
	var rich_text = panel.get_node("RichTextLabel")
	var texture_rect = panel.get_node("TextureRect4")
	

	# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
	rich_text.text = "Ah, esta taza. Parece de 'Café EliteQuest'. El único lugar donde el café cuesta más que una consola de nueva generación y aún así sabe a descarga ilegal."
	texture_rect.texture = preload("res://images/avatars/prota2.png") 
	
	var cafe = get_node(root+"cafe")
	cafe.visible = false
	check_all_buttons()
	


func _on_button_up_poster():
	isPoster = true
	var panel = get_node(root+"Panel")
	var rich_text = panel.get_node("RichTextLabel")
	var texture_rect = panel.get_node("TextureRect4")

	# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
	rich_text.text = "Oh, la 'NerdFest'. \nLa única convención donde el código binario es un segundo idioma y los debates sobre Star Wars vs. Star Trek son una religión...\n El lugar donde ir vestido normal es el verdadero disfraz."
	texture_rect.texture = preload("res://images/avatars/prota2.png") 
	
	var button = get_node(root+"poster")
	button.visible = false
	check_all_buttons()


func _on_button_up_premio():
	isPremio = true
	var panel = get_node(root+"Panel")
	var rich_text = panel.get_node("RichTextLabel")
	var texture_rect = panel.get_node("TextureRect4")

	# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
	rich_text.text = "Oh, el galardón de 'Karaoke FameBelt'.\nEs como el Grammy para los que cantan solo en la ducha y en bares después de las 2 a.m."
	texture_rect.texture = preload("res://images/avatars/prota2.png") 
	
	var button = get_node(root+"premio")
	button.visible = false
	check_all_buttons()


func check_all_buttons():
	if (isCafe and isPoster and isPremio): 
		# Carga la nueva escena
		var main_node = get_node("/root/level2/Buttonlevel2") 
		# Llamar a la función en el nodo principal
		main_node.last_action()
