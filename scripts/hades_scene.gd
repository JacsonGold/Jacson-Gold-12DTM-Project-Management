extends Control

@onready var text = $RichTextLabel
var proceed = 0

func _on_button_pressed():
	if proceed == 2:
		get_tree().change_scene_to_file("res://scenes/level4.tscn")
	elif proceed == 1:
		text.text = "Orpheus hastily agreed. Sprinting out of the room, he dropped his lyre, and did not turn back."
		proceed = proceed + 1
	elif proceed == 0:
		text.text = "After hearing the love in his voice, Hades agreed to let his wife's soul be released from the underworld,
on one condtition. He must not look back at Euridice. Orpheus could have his wife back, if he made his way out of the underworld
without turning back."
		proceed = proceed + 1
	else:
		proceed = proceed + 1
		print("Proceed is equal to " + str(proceed))
