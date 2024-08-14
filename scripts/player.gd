extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -250.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D
@onready var lyre_sound = $LyreSound
@export var Coyote_Time: float = 0.2
@onready var coyote_timer = $CoyoteTimer
@export var Jump_Buffer_Time: float = 0.1

var Jump_Available: bool = true
var Jump_Buffer: bool = false

func _physics_process(delta):
	if not Global.player_death:
		handle_inputs(delta)
	else:
		animated_sprite.play("dead")

func handle_inputs(delta):
	# Add the gravity.
	if not is_on_floor():
		if coyote_timer.is_stopped():
			coyote_timer.start(Coyote_Time)
		#get_tree().create_timer(Coyote_Time).timeout.connect(Coyote_Timeout)
		velocity.y += gravity * delta
	else:
		Jump_Available = true
		coyote_timer.stop()
		if Jump_Buffer:
			Jump()
			Jump_Buffer = false

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if Jump_Available:
			Jump()
		else:
			Jump_Buffer = true
			get_tree().create_timer(Jump_Buffer_Time).timeout.connect(on_jump_buffer_timeout)
		#velocity.y = JUMP_VELOCITY
		#Jump_Available = false
	elif Input.is_action_just_pressed("attack"):
		if Global.lyre_pickup == true:
			$PlayerAttack.attack()
			lyre_sound.play()
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

func Jump()->void:
	velocity.y = JUMP_VELOCITY
	Jump_Available = false

func Coyote_Timeout():
	Jump_Available = false

func on_jump_buffer_timeout()->void:
	Jump_Buffer = false
