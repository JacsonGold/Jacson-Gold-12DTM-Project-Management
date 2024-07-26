extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -250.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if not Global.player_death:
		handle_inputs(delta)
	else:
		animated_sprite.play("dead")

func handle_inputs(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("attack"):
		if Global.lyre_pickup == true:
			$PlayerAttack.attack()
	# Get the input direction -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
		$PlayerAttack/CollisionShape2D.position.x = 0
		$PlayerAttack/AnimatedSprite2D.position.x = 0
		$PlayerAttack/AnimatedSprite2D.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		$PlayerAttack/CollisionShape2D.position.x = -36
		$PlayerAttack/AnimatedSprite2D.position.x = -36
		$PlayerAttack/AnimatedSprite2D.flip_h = true
	
	# Play animations

	if Global.lyre_pickup == true:
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("lyre_idle")
			else:
				animated_sprite.play("lyre_run")
		else:
			animated_sprite.play("lyre_jump")
	elif Global.lyre_pickup == false:
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		else:
			animated_sprite.play("jump")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
