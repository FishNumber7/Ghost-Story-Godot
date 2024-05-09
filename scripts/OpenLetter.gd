extends Label

signal teleport_player

func _on_button_1_pressed():
	button_actions()
	$"../../End Room/MeshInstance3D/MeshInstance3D2/OmniLight3D".visible = true
	

func _on_button_2_pressed():
	button_actions()
	$"../../End Room/MeshInstance3D/MeshInstance3D2/OmniLight3D2".visible = true
	
func button_actions():
	self.visible = false
	teleport_player.emit(Vector3(0,.652,192))
	await get_tree().create_timer(1).timeout
	$"../ColorRect".visible = false
	await get_tree().create_timer(1).timeout
	self.text = "Game is over... to be continued!"
	$button1.visible = false
	$button2.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	self.visible = true
