extends Button

func _on_pressed():
	print("Level 3 Begin")
	get_tree().change_scene_to_file("res://scenes/level3.tscn")
	pass # Replace with function body.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
