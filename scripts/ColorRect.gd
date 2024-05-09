extends ColorRect

var alpha = 1
signal start
# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,0), 4)
	await tween.finished
	start.emit()

func _on_areas_envelope_transition():
	self.modulate = Color(0,0,0,1)
	await get_tree().create_timer(1.5).timeout
	$"../OpenLetter".visible = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
