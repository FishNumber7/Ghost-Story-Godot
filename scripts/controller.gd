extends Control

@onready var _ink_player = $InkPlayer
@export var choice_button_one : Button 
@export var choice_button_two : Button 
@export var choice_button_three : Button
@export var text_label_one : Label
@export var text_label_two : Label
@export var text_label_three : Label

var buttons 
var labels
var prev_tag
var label
var prompted
var time_waiting = 0
var third_button = false

func _story_ready():
	label = 0
	prompted = false
	labels = [text_label_one, text_label_two, text_label_three]
	buttons = [choice_button_one, choice_button_two, choice_button_three]
	print("readied")
	#$ColorRect.modulate = Color(1,1,1,0)
	_ink_player.create_story()


func _story_loaded(successfully: bool):
	print("loaded")
	if !successfully:
		return

	_ink_player.continue_story()


func _continued(text, tags):
	print(text)
	print("continued")
	if !text.is_empty() and !prompted:
		await interacted
	else:
		prompted = false
	if label == 0:
		for l in labels:
			l.modulate = Color(1,1,1,0)
	if time_waiting > 0:
		await get_tree().create_timer(time_waiting).timeout
		time_waiting = 0
	labels[label].text = text
	var tween = get_tree().create_tween()
	tween.tween_property(labels[label], "modulate", Color(1,1,1,1), .8)
	label = (label + 1) % 3
	process_tags(tags)
	await tween.finished
	_ink_player.continue_story()
	
func process_tags(tags):
	if !tags.is_empty():
		prints(tags[0])
		if tags[0] == "video":
			$video.play(tags[1])
		elif tags[0] == "white":
			$ColorRect.modulate = Color(1,1,1,float(tags[1]))
		elif tags[0] == "wait":
			if tags.size() == 3:
				if tags[2] == "clear":
					label = 0
			time_waiting = int(tags[1])


func _prompt_choices(choices):
	print("choices")
	if !choices.is_empty():
		prompted = true
		if choices.size() == 1:
			buttons[2].content.text = choices[0].text
			buttons[2].visible = true
			third_button = true
		else:
			for i in range(choices.size()):
				buttons[i].content.text = choices[i].text
				buttons[i].visible = true

func _ended():
	print("The End")
	var tween = get_tree().create_tween()
	tween.tween_property($Loading, "modulate", Color(1,1,1,1), .2)
	await tween.finished
	Global.goto_scene("res://scenes/afterlife.tscn")


func _select_choice(index):
	for i in range(buttons.size()):
		buttons[i].visible = false
	if third_button:
		_ink_player.choose_choice_index(0)
		third_button = false
	_ink_player.choose_choice_index(index)
	_continue_story()

func _continue_story():
	_ink_player.continue_story()
	
signal interacted
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		interacted.emit()
