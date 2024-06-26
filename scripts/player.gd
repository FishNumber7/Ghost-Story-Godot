extends CharacterBody3D

signal interacted

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var can_move = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck = $Pivot
@onready var camera = $Pivot/Camera3D

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif Input.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event is InputEventMouseMotion and can_move:
		neck.rotate_y(-event.relative.x * 0.005)
		camera.rotate_x(-event.relative.y * 0.005)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))
	if Input.is_action_pressed("interact"):
		interacted.emit()

func _physics_process(delta):
	if !can_move:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _on_start():
	can_move = true


func _teleport_player(new_position):
	self.position = new_position
