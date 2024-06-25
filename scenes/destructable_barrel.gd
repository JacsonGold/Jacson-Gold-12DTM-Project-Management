extends CharacterBody2D

var health = 1

@onready var animated_sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func barrel_death():
	animated_sprite.play("destruction")
	queue_free()

func take_damage(damage):
	health -= damage
	if health < 0:
		barrel_death()
