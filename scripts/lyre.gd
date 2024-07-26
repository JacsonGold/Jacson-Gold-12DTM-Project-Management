extends Area2D
@onready var animated_sprite = $AnimatedSprite2D

# Defining of whether or not Lyre has been collected
func _on_body_entered(body):
	Global.lyre_pickup = true
	print(Global.lyre_pickup)
	queue_free()
