extends AnimatedSprite3D

@export var sequence : String

# Called when the node enters the scene tree for the first time.
func _ready():
	self.play(sequence)
