extends Area2D

func _on_body_entered(body):
	print("Second Level Completed")
	get_tree().change_scene_to_file("res://scenes/ferryman_scene.tscn")
	pass # Replace with function body.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

