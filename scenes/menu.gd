extends Control
  

func _ready():
	$AudioStreamPlayer2D.play()


func _on_tree_exiting():
	$AudioStreamPlayer2D.stop()
	
	
func start_game():
	# Carga la nueva escena
	
	var new_scene_resource: PackedScene
	new_scene_resource = preload("res://scenes/level1.tscn")
	var new_scene = new_scene_resource.instantiate()

	# Añade la nueva escena al árbol
	get_tree().root.add_child(new_scene)

	# Asegúrate de que la nueva escena está activa
	get_tree().current_scene = new_scene

	# Quita la escena actual
	queue_free()
 
