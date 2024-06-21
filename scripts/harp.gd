extends Area2D
# Defining of whether or not Lyre has been collected
@onready var variables = %Variables
var lyre_pickup = false
func _on_body_entered(body):
	lyre_pickup = true
	queue_free()
