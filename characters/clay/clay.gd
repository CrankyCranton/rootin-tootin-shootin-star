class_name Clay extends CharacterBody3D


const GRAVITY_SCALE: float = 1.0
const SPEED: float = 4.0
const RUN_SPEED: float = 10.0
const TRACTION: float = 15.0
const MOUSE_SENSITIVITY: float = 0.1
const MAX_TILT: float = 75.0

@onready var head: Marker3D = $Head


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var vel: Vector2 = event.screen_relative * MOUSE_SENSITIVITY
		head.rotation_degrees.x -= vel.y
		head.rotation_degrees = head.rotation_degrees.clampf(-MAX_TILT, MAX_TILT)
		rotation_degrees.y -= vel.x


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * GRAVITY_SCALE * delta

	var input: Vector2 = Input.get_vector(&"left", &"right", &"forward", &"backward")
	var speed: float = RUN_SPEED if Input.is_action_pressed(&"dash") else SPEED
	var target_vel := Vector3(input.x, 0.0, input.y).rotated(Vector3.UP, rotation.y) * speed
	var y: float = velocity.y
	velocity = velocity.lerp(target_vel, TRACTION * delta)
	velocity.y = y
	move_and_slide()
