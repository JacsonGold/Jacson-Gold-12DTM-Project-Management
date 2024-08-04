extends CharacterBody2D

var health = 1

@onready var collision_shape = $CollisionShape2D
@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.play("default")
	collision_shape.disabled = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func sleep():
	animated_sprite.play("sleep")
	collision_shape.set_deferred("disabled", false)
	
func take_damage(damage):
	health -= damage
	if health > 0:
		animated_sprite.play("default")
	else:
		sleep()
		collision_shape.set_deferred("disabled", true)
