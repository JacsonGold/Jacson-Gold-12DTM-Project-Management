extends AnimatedSprite2D

const SPEED = 60

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += SPEED * delta
