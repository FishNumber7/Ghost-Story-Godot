extends Area3D

signal envelope_body_entered
signal envelope_text

var connected = false

func _on_body_entered(body):
	envelope_body_entered.emit(body, 3)
	envelope_text.emit(body, "It's an envelope...?")
