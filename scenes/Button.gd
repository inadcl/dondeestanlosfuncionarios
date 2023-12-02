extends TextureButton 
 
 
func _on_button_up():
	get_tree().root.get_node("MainMenu").start_game()


func _on_button_down():
	$audioclick.play()
