extends CharacterBody2D

@export var spawn_point: Vector2 = Vector2(128, 100) 
const SPEED = 500.0
const JUMP_VELOCITY = -550.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_knocked_back: bool = false

func _ready() -> void:
	tp_spawn()

func jump():
	velocity.y = JUMP_VELOCITY

func jump_side(x):
	velocity.x = x
	velocity.y = JUMP_VELOCITY
	is_knocked_back = true 

func tp_spawn():
	global_position = spawn_point
	velocity = Vector2.ZERO
	is_knocked_back = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		if is_knocked_back and velocity.y >= 0:
			is_knocked_back = false

	if Input.is_action_just_pressed("jump") and is_on_floor() and not is_knocked_back:
		jump()

	var direction := Input.get_axis("left", "right")

	# CONTROLS
	if is_knocked_back:
		pass
	else:
		if direction:
			velocity.x = direction * SPEED
			
			if direction > 0:
				sprite.flip_h = true
			elif direction < 0:
				sprite.flip_h = false
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED * delta * 15)

	move_and_slide()
	
	# ANIMATIONS
	if not is_on_floor():
		# Todo: sprite.play("jump") 
		pass
	elif direction != 0 and not is_knocked_back:
		sprite.play("run")
	else:
		sprite.play("idle")
