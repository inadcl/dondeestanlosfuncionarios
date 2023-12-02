extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass # Replace with function body.

func _on_mouse_entered():
	print("Mouse entered: ", self.name)
	var referencia = get_node("/root/Miniqueinesquien")
	
	referencia.processButton(self)
