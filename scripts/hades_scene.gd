extends Control

@onready var text = $RichTextLabel
var proceed = 0

func _on_button_pressed():
	if proceed == 2:
		get_tree().change_scene_to_file("res://scenes/ferryman_scene.tscn")
	elif proceed == 1:
		text.text = "Orpheus hastly agreed, sprinting out of the room, dropping his lyre and not turning back."
		proceed = proceed + 1
	elif proceed == 0:
		text.text = "After hearing the love in his voice, Hades agreed to let his wifes soul be release from the underworld.
On one condtition. Orpheus could have his wife back, if he made his way out of the underworld
and didn't turn back to check if she was there."
		proceed = proceed + 1
	else:
		proceed = proceed + 1
		print("Proceed is equal to " + str(proceed))
