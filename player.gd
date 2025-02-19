extends CharacterBody3D

@export var speed = 5.0
@export var jump_strength = 10.0
@export var gravity = -9.8

@onready var camera = $Camera3D

func _ready():
	camera.current = true 

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	if Input.is_action_pressed("move_backward"):
		direction += transform.basis.z
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	if Input.is_action_pressed("move_right"):
		direction += transform.basis.x
	
	direction = direction.normalized()
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_strength
	else:
		velocity.y += gravity * delta
	
	move_and_slide()
