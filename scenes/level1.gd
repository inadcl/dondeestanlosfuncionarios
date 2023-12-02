extends Control 
  
var new_scene_resource: PackedScene

func _ready():
	$AudioStreamPlayer2D.play()


func _on_tree_exiting():
	$AudioStreamPlayer2D.stop()
