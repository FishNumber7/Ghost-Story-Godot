extends Label

var is_displayed = false
var left_area = false
var new_text = ""
var entered_area = false
var tween : Tween
var started = false
var connected = false

func _on_interacted():
	print(self.text)
	if is_displayed or self.text == "" or !started:
		return
	is_displayed = true
	tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,1), .75)
	await tween.finished
	await get_tree().create_timer(1).timeout
	tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,0), .75)
	await tween.finished
	is_displayed = false
	
	if entered_area:
		self.text = new_text
	elif left_area:
		self.text = ""

func _on_body_entered(_body, extra_arg_0):
	print("hi1")
	if is_displayed:
		new_text = extra_arg_0
		entered_area = true
		left_area = false
	else:
		self.text = extra_arg_0
	
func _on_body_exited(_body):
	print("hi2")
	if is_displayed:
		left_area = true
		entered_area = false
	else:
		self.text = ""


func _on_finished():
	started = true


func _connect_envelope():
	if !connected:
		connected = true
		$"../../Areas/Area4".envelope_text.connect(_on_body_entered)


func _disconnect_envelope():
	$"../../Areas/Area4".envelope_text.disconnect(_on_body_entered)
