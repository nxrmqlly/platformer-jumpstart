extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -550.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction > 0:
			sprite.flip_h = true
		elif direction < 0:
			sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if not is_on_floor():
		# Todo: sprite.play("jump") 
		pass
	elif direction != 0:
		sprite.play("run")
	else:
		sprite.play("idle")
