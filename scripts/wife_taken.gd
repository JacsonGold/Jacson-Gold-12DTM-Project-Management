extends Control

@onready var anim = $Anim
@onready var text = $RichTextLabel
@onready var black = $Black
@onready var run = $NewlywedRun

var proceed = 0

func _on_button_pressed():
	if proceed == 5:
		proceed = proceed + 1
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
	elif proceed == 4:
		proceed = proceed + 1
		run.visible = true
		text.text = "They spent the rest of eternity walking in the underworld together. Orpheus no longer needed to fear looking back."
	elif proceed == 3:
		proceed = proceed + 1
		text.text = "Many years later, he lost his mortal form. Orpheus was able to return to the underworld, where he found Euridice."
	elif proceed == 2:
		proceed = proceed + 1
		text.text = "He stumbled out of the rubble empty handed, unable to return."
	elif proceed == 1:
		black.visible = true
		text.text = "The entrance to the underworld collapsed, blocking Orpheus out."
		proceed = proceed + 1
	elif proceed == 0:
		anim.hide()
		text.text = "The love of his life disappeared, the spot where she once was now empty."
		proceed = proceed + 1
	else:
		proceed = proceed + 1
		print("Proceed is equal to " + str(proceed))
