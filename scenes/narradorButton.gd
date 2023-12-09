extends Button

var isActive = true
var action = 0
var previous_time:int = 0 
var arrowImage = true

# Definiendo cuántos milisegundos deben pasar antes de que la función pueda ejecutarse nuevamente
var root = "/root/Miniquienesquien/"
var blockMouse = true

func changeArrowVisibilityTo(visibility:bool):
	var image = get_node(root+"arrowok")
	image.visible = visibility

func setArrowImage(arrowImage): 
	var texture_rect = get_node(root+"arrowok")
	if arrowImage:
		texture_rect.texture = preload("res://images/ui/flecha.png")
	else:
		texture_rect.texture = preload("res://images/ui/lupa.png")
		
func _ready():
	get_node("/root/Miniquienesquien/NarradorIni").play()
	isActive = true
	changeArrowVisibilityTo(false)
	setArrowImage(true)


func runAction(isFinal, actioncount, audiooff, audioon, avatar_preload, texto):						
	get_node(audiooff).stop()
	get_node(audioon).play()  
	var panel = get_node(root+"Panel")
	var rich_text = panel.get_node("RichTextLabel")
	var texture_rect = panel.get_node("TextureRect4")
	rich_text.text = texto
	texture_rect.texture = avatar_preload
	actioncount = actioncount +1
	if isFinal:
		GlobalVariables.changeLevel(GlobalVariables.level+1)
		isActive = false 
		self.visible=false
		setArrowImage(false)
	else:
		setArrowImage(true)
	return actioncount


func nextText():  
	if isActive:
		get_node("/root/Miniquienesquien/action").play()
		#var current_time_string = string_time_to_seconds(Time.get_time_string_from_system()) # Asumiendo que este es tu método
		#if (int(current_time_string) - int(previous_time)) > TIME_INTERVAL:
		print(blockMouse)
		if !blockMouse:
			changeArrowVisibilityTo(false)
			blockMouse = true
			get_node(root+"mousetimer").start()
			#previous_time=current_time_string
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
				elif action == 11:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador09", "/root/Miniquienesquien/Narrador10", 
					preload("res://images/avatars/narrador.png"),
					"Aquellos que murmuran 'Yippee-ki-yay' y  llevan una insignia de policía imaginaria, no son a quienes buscamos. ¿Quiénes son estos héroes de acción?")
			
			elif GlobalVariables.level == 5:
				if action == 12:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador10", "/root/Miniquienesquien/Narrador11", 
					preload("res://images/avatars/narrador.png"),
					"'Yippee-ki-yay', el funcionario no pondria su vida en peligro por salvar su ciudad.")
				elif action == 13:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador11", "/root/Miniquienesquien/Narrador12", 
					preload("res://images/avatars/narrador.png"),
					"Descarta a los que podrían haber explorado mundos de fantasía. ¿Quiénes son estos aventureros de pantalla que hoy dejamos fuera?")
			elif GlobalVariables.level == 6:
				if action == 14:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador12", "/root/Miniquienesquien/Narrador13", 
					preload("res://images/avatars/narrador.png"),
					"Los mundos de fantasía están bien, pero el funcionario que buscamos tiene preferencias más siniestras.")
				elif action == 15:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador13", "/root/Miniquienesquien/Narrador14", 
					preload("res://images/avatars/narrador.png"),
					"Elimina a los que han practicado su mejor 'esquiva de balas' en el espejo. ¿Quiénes son estos fanáticos de la trilogía que necesitan actualizar su guardarropa?")
			elif GlobalVariables.level == 7:
				if action == 16:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador14", "/root/Miniquienesquien/Narrador15", 
					preload("res://images/avatars/narrador.png"),
					"Despues del fiasco de la última película no se como se atreven a seguir disfrazados de neo... ¡Entramos en la recta final!")
				elif action == 17:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador15", "/root/Miniquienesquien/Narrador16", 
					preload("res://images/avatars/prota2.png"),
					"Ya te digo, es penosa, ¡si no me hubiera dormido a los 20 minutos hubiese exijido que me devolviesen el dinero!")
				elif action == 18:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador16", "/root/Miniquienesquien/Narrador17", 
					preload("res://images/avatars/narrador.png"),
					"Aunque muchos funcionarios parezcan estar en otro planeta, nuestro funcionario no parece de una raza extraterrestre, o al menos, parece humano.")
			elif GlobalVariables.level == 8:
				if action == 19:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador17", "/root/Miniquienesquien/Narrador18", 
					preload("res://images/avatars/narrador.png"),
					"Ya quedan pocos, joven padawan")
				elif action == 20:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador18", "/root/Miniquienesquien/Narrador19", 
					preload("res://images/avatars/prota2.png"),
					"Menos mal, el calor humano de la convención ha creado una atmósfera en la que no se si seré capaz de sobrevivir mucho más tiempo")
				elif action == 21:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador19", "/root/Miniquienesquien/Narrador20", 
					preload("res://images/avatars/narrador.png"),
					"¿Qué grupo de personas nunca se asusta cuando ve un fantasma, pero siempre lleva consigo una aspiradora gigante?")
			elif GlobalVariables.level == 9:
				if action == 22:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador20", 
					"/root/Miniquienesquien/Narrador21", 
					preload("res://images/avatars/narrador.png"),
					"Los cazafantasmas han tenido una emergencia, quedan descartados.")
				elif action == 23:
					action=runAction(false, action, 
					"/root/Miniquienesquien/Narrador21", 
					"/root/Miniquienesquien/Narrador22", 
					preload("res://images/avatars/prota2.png"),
					"Quizás mi amigo Rober este contando otra de sus azañas en el bar de abajo...")
				elif action == 24:
					action=runAction(true, action, 
					"/root/Miniquienesquien/Narrador22", 
					"/root/Miniquienesquien/Narrador23", 
					preload("res://images/avatars/narrador.png"),
					"Vamos con otra, se creen dueños de la noche, creen infundir el terror entre los hombres con sus largos colmillos, \npero realmente son unos plastas que se pasan 3 horas hablando en sus peliculas mas taquilleras.")
			elif GlobalVariables.level == 10:
				if action == 25:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador23", 
					"/root/Miniquienesquien/Narrador24", 
					preload("res://images/avatars/narrador.png"),
					"Parece que los vampiros ya no serán un problema.")
				elif action == 26:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador24", 
					"/root/Miniquienesquien/Narrador25", 
					preload("res://images/avatars/prota2.png"),
					"Menos mal, mi ex novia me obligó a ver una de sus peliculas y casi corto con ella... luego... la encontré con el vecino, \ndespues de haberle perdonado por obligarme a ver a edward hablando con bella, le perdonaría cualquier cosa, pero no sirvió de nada, me dejó por el poco despues.")
				elif action == 27:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador25", 
					"/root/Miniquienesquien/Narrador26", 
					preload("res://images/avatars/narrador.png"),
					"mmm...buenooo... Pero eso es otra historia, ¡céntrate!\nlos siguientes podrian ser amigos de bender, al menos más que un humano, aunque seguramente les dejaria sin blanca por pringados.")
			elif GlobalVariables.level == 11:
				if action == 28:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador26", "/root/Miniquienesquien/Narrador27", 
					preload("res://images/avatars/narrador.png"),
					"¡Besa mi brillante culo trasero! jejeje, perdona, siempre quise decirlo")
				elif action == 29:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador27", "/root/Miniquienesquien/Narrador28", 
					preload("res://images/avatars/prota2.png"),
					"¿Sabes qué? Pues ahora pienso montar mi propio país, con recaudadores de impuestos mafiosos, y furcias! es más, paso del país, y de los recaudadores... jejeje")
				elif action == 30:
					action=runAction(true, action, "/root/Miniquienesquien/Narrador28", "/root/Miniquienesquien/Narrador29", 
					preload("res://images/avatars/narrador.png"),
					"hehehe, Ha estado bien, pero no nos desviemos.\nCuidan más a sus comics, que su higiene corporal.\n¿de qué se disfrazarían aquellos que tratan el ultimo capítulo de marvel como un creyente a la virgen durante una procesión?")
			elif GlobalVariables.level == 12:
				if action == 31:
					action=runAction(false, action, "/root/Miniquienesquien/Narrador29", "/root/Miniquienesquien/jugador03", 
					preload("res://images/avatars/prota2.png"),
					"¡Hey! ¡Ya solo queda uno!")
				elif action == 32:
					action=runAction(true, action, "/root/Miniquienesquien/jugador03", "/root/Miniquienesquien/Narrador30", 
					preload("res://images/avatars/narrador.png"),
					"Adelante...")
			elif GlobalVariables.level == 13:
				#tengo que volver a poner el fondo de la comicon
				if action == 33:
					var fondoLoaded = preload("res://images/background/geeks (2).png")
					var texture_rect = get_node(root+"TextureRect")
					texture_rect.texture = fondoLoaded
					action=runAction(false, action, "/root/Miniquienesquien/Narrador30", "/root/Miniquienesquien/jugador04", 
					preload("res://images/avatars/prota2.png"),
					"Perdona, estoy buscando al funcionario del departamento de notificaciones sencillas para cumplimentar esta notificación que me requiere hacienda...")
				elif action == 34:
					action=runAction(false, action, "/root/Miniquienesquien/jugador04", "/root/Miniquienesquien/funcionario01", 
					preload("res://images/qeq/n/_d6f3f3ba-2761-43bd-95f9-90d75da2bc4a-removebg-preview.png"),
					"Siento una pertubarcion en la fuerza... ¿Como has dado conmigo? ¿tienes cita previa?")
				elif action == 35:
					action=runAction(false, action, "/root/Miniquienesquien/funcionario01", "/root/Miniquienesquien/jugador05", 
					preload("res://images/avatars/prota.png"),
					"No, claro que no tengo cita previa, si no relleno la notificacion de hacienda, en el departamento de notificaciones sencillas hoy, hacienda me pondra una multa de 10.000 euros")
				elif action == 36:
					action=runAction(false, action, "/root/Miniquienesquien/jugador05", "/root/Miniquienesquien/funcionario02", 
					preload("res://images/qeq/n/_d6f3f3ba-2761-43bd-95f9-90d75da2bc4a-removebg-preview.png"),
					"Pero sin cita previa yo no puedo hacer nada...")
				elif action == 37:
					action=runAction(false, action, "/root/Miniquienesquien/funcionario02", "/root/Miniquienesquien/jugador06", 
					preload("res://images/avatars/prota2.png"),
					"Como no me des una solución vamos a tener problemas, y la fuerza es poderosa en mi... Mira mi puño levantandose con el poder de la fuerza...")
				elif action == 38:
					action=runAction(false, action, "/root/Miniquienesquien/jugador06", "/root/Miniquienesquien/funcionario03", 
					preload("res://images/qeq/n/_d6f3f3ba-2761-43bd-95f9-90d75da2bc4a-removebg-preview.png"),
					"Está bien, está bien... yo no puedo hacer nada pero el jefe del departamento de notificaciones sencillas si, te daré una pista, \"Ruge con fuerza pero no está en la selva\"")
				elif action == 39:
					get_node("/root/Miniquienesquien/funcionario03").stop()
					endScene()


func endScene():
	GlobalVariables.vaderEncontrado()
	GlobalVariables.changeLevel(0)
	var main_node = get_node("/root/Miniquienesquien") 
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
					
					
					
					#todo: continuar con la accion 30 level 11 (puedo hardcodearlo para no tener que hacer el juego entero)
					#tengo que añadir que puedas clickaer en el darhvadr. y la conversacion final con el narrador, 
					#la conversacion con el funcionario, y volver a la zona de seleccion de misiones.
#¡Correcto! Adiós a los vestidos largos y las coronas. Buscamos a alguien un poco más oscuro.


func _on_button_down():
	nextText()


func _on_mousetimer_timeout():
	changeArrowVisibilityTo(true)
	blockMouse = false
	
