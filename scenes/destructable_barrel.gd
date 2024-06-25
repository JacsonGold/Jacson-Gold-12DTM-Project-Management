extends CharacterBody2D

var health = 1

@onready var animated_sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.play("idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func barrel_death():
	animated_sprite.play("destruction")

func take_damage(damage):
	health -= damage
	if health > 0:
		animated_sprite.play("idle")
	else:
		barrel_death()
