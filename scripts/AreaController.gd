extends Node3D

signal activate_door
signal interact_display
signal interact_hide
signal connect_envelope
signal envelope_transition

var current_area = -1
var connected = false
var letter = [false, false, false]


func _on_area_body_entered(body, area):
	current_area = area
	if body == $"../Player":
		interact_display.emit()

func _on_area_body_exited(body):
	current_area = -1
	if body == $"../Player":
		interact_hide.emit()


func _on_player_interacted():
	if current_area != -1 and current_area < 3:
		letter[current_area] = true
		if !connected and !letter.has(false):
			connected = true
			$Area4.envelope_body_entered.connect(_on_area_body_entered)
			connect_envelope.emit()
	if current_area == 3:
		$Area4.envelope_body_entered.disconnect(_on_area_body_entered)
		activate_door.emit()
	if current_area == 4:
		envelope_transition.emit()
