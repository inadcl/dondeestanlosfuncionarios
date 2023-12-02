extends Button

var isActive = true
var action = 0
var previous_time:int = 0 


# Definiendo cuántos milisegundos deben pasar antes de que la función pueda ejecutarse nuevamente
const TIME_INTERVAL:int = 1 # 5000 ms o 5 segundos

var root = "/root/Miniquienesquien/"


func string_time_to_seconds(time_string: String) -> int:
	var parts = time_string.split(":")
	if parts.size() != 3:
		return 0.0

	var hours = float(parts[0])
	var minutes = float(parts[1])
	var seconds = float(parts[2])

	return hours * 3600 + minutes * 60 + seconds
# Called when the node enters the scene tree for the first time.
func _ready():
	
	get_node("/root/Miniquienesquien/NarradorIni").play()
	isActive = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func runAction(isFinal, actioncount, audiooff, audioon, avatar_preload, texto):						
	get_node(audiooff).stop()
	get_node(audioon).play()  
	var panel = get_node(root+"Panel")
	var rich_text = panel.get_node("RichTextLabel")
	var texture_rect = panel.get_node("TextureRect4")

						# Ahora puedes modificar las propiedades o llamar a métodos de estos nodos
	rich_text.text = texto
	texture_rect.texture = avatar_preload
	actioncount = actioncount +1
	if isFinal:						
		GlobalVariables.changeLevel(GlobalVariables.level+1)
		isActive = false 
		self.visible=false

	return actioncount
		
	

func nextText():  
	print("Buttondown")
	
	if isActive:
		get_node("/root/Miniquienesquien/action").play()
		var current_time_string = string_time_to_seconds(Time.get_time_string_from_system()) # Asumiendo que este es tu método
			
		if (int(current_time_string) - int(previous_time)) > TIME_INTERVAL:
			previous_time=current_time_string	
			if  GlobalVariables.level==0:
					if action == 0: 
						action = runAction(false, action, "/root/Miniquienesquien/NarradorIni", "/root/Miniquienesquien/jugador01", 
						preload("res://images/avatars/prota2.png"), 
						"¡Vaya, adivinanzas! pense que habias dicho que no habría más ¿Esto es una conferencia friki o un examen sorpresa?")
					elif action == 1: 
						action = runAction(false, action, "/root/Miniquienesquien/jugador01", "/root/Miniquienesquien/Narrador01", 
						preload("res://images/avatars/narrador.png"),
						"En nuestro mundo, las mejores aventuras siempre incluyen un enigma o dos, ¡o quizás diez!")
					elif action == 2: 
						action = runAction(false, action, "/root/Miniquienesquien/Narrador01", "/root/Miniquienesquien/jugador02", 
						preload("res://images/avatars/prota2.png"),
						"Esta bien... descartemos aquellos que no sean funcionarios.")
					elif action == 3: 
						action = runAction(true, action, "/root/Miniquienesquien/jugador02", "/root/Miniquienesquien/Narrador02", 
						preload("res://images/avatars/narrador.png"),
						"El funcionario no se encuentra entre quienes responde este enigma: \nEn el baile del palacio o en una torre encerradas, muchas de ellas envidiadas, suelen ser el centro de las historias encantadas.")
			elif GlobalVariables.level == 1:
				if action == 4:						
					action = runAction(false, action, "/root/Miniquienesquien/Narrador02", "/root/Miniquienesquien/Narrador03", 
					preload("res://images/avatars/narrador.png"),
					"Muy bien joven padawan, princesas eliminadas.")
				elif action == 5:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador03", "/root/Miniquienesquien/Narrador04", 
					preload("res://images/avatars/narrador.png"),
					"El que buscamos no se encuentra entre seres de gracia etérea y orejas que susurran secretos antiguos. Ningun funcionario vive en los bosques. ¿A quiénes descartamos?")					
					
			elif GlobalVariables.level == 2:
				print("level2")
				print(action)
				if action == 6:						
					action=runAction(false, action, "/root/Miniquienesquien/Narrador04", "/root/Miniquienesquien/Narrador05", 
					preload("res://images/avatars/narrador.png"),
					"Muy bien joven padawan, unos elfos menos.")					
				elif action == 7:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador05", "/root/Miniquienesquien/Narrador06", 
					preload("res://images/avatars/narrador.png"),
					"Descarta a aquellos que podrían pasar desapercibidos incluso en una multitud como esta. Hábiles, silenciosos y misteriosos, elige con sabiduria.")					
			
			elif GlobalVariables.level == 3:
				if action == 8:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador06", "/root/Miniquienesquien/Narrador07", 
					preload("res://images/avatars/narrador.png"),
					"Muy bien joven padawan, los frikis con ínfulas de ninja ya no molestarán.")
				elif action == 9:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador07", "/root/Miniquienesquien/Narrador08", 
					preload("res://images/avatars/narrador.png"),
					"No estamos buscando a los que podrían pasar su tiempo en el Callejón Diagon. Aficionados a las pociones y a los hechizos, pero no a los formularios gubernamentales. ¿Quiénes son?")

			elif GlobalVariables.level == 4:
				if action == 10:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador08", "/root/Miniquienesquien/Narrador09", 
					preload("res://images/avatars/narrador.png"),
					"Hocus pocus, y los magos de pega han desaparecido.")
				if action == 11:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador09", "/root/Miniquienesquien/Narrador10", 
					preload("res://images/avatars/narrador.png"),
					"Aquellos que murmuran 'Yippee-ki-yay' y  llevan una insignia de policía imaginaria, no son a quienes buscamos. ¿Quiénes son estos héroes de acción?")
			
			elif GlobalVariables.level == 5:
				if action == 12:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador10", "/root/Miniquienesquien/Narrador11", 
					preload("res://images/avatars/narrador.png"),
					"'Yippee-ki-yay', el funcionario no pondria su vida en peligro por salvar su ciudad.")
				if action == 13:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador11", "/root/Miniquienesquien/Narrador12", 
					preload("res://images/avatars/narrador.png"),
					"Descarta a los que podrían haber explorado mundos de fantasía. ¿Quiénes son estos aventureros de pantalla que hoy dejamos fuera?")
			elif GlobalVariables.level == 6:
				if action == 14:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador12", "/root/Miniquienesquien/Narrador13", 
					preload("res://images/avatars/narrador.png"),
					"Los mundos de fantasía están bien, pero el funcionario que buscamos tiene preferencias más siniestras.")
				if action == 15:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador13", "/root/Miniquienesquien/Narrador14", 
					preload("res://images/avatars/narrador.png"),
					"Elimina a los que han practicado su mejor 'esquiva de balas' en el espejo. ¿Quiénes son estos fanáticos de la trilogía que necesitan actualizar su guardarropa?")
			elif GlobalVariables.level == 7:
				if action == 16:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador14", "/root/Miniquienesquien/Narrador15", 
					preload("res://images/avatars/narrador.png"),
					"Despues del fiasco de la última película no se como se atreven a seguir disfrazados de neo... ¡Entramos en la recta final!")
				if action == 17:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador15", "/root/Miniquienesquien/Narrador16", 
					preload("res://images/avatars/prota2.png"),
					"Ya te digo, es penosa, ¡si no me hubiera dormido a los 20 minutos hubiese exijido que me devolviesen el dinero!")
				if action == 18:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador16", "/root/Miniquienesquien/Narrador17", 
					preload("res://images/avatars/narrador.png"),
					"Aunque muchos funcionarios parezcan estar en otro planeta, nuestro funcionario no parece de una raza extraterrestre, o al menos, parece humano.")
					
					
					
#¡Correcto! Adiós a los vestidos largos y las coronas. Buscamos a alguien un poco más oscuro.


func _on_button_down():
	nextText()
