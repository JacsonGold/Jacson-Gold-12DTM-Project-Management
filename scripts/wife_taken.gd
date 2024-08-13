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
		text.text = "And they spent the rest of time walking in the underworld together. Orpheus no longer had the fear of looking back."
	elif proceed == 3:
		proceed = proceed + 1
		text.text = "That was until many years later, when he would lose his mortal form, and was able to return to the underworld, where he found Euridice."
	elif proceed == 2:
		proceed = proceed + 1
		text.text = "He stumbled out of the rubble. And was unable to go to the underworld ever again."
	elif proceed == 1:
		black.visible = true
		text.text = "The entrance to the underworld colapsed, blocking Orpheus out forever."
		proceed = proceed + 1
	elif proceed == 0:
		anim.hide()
		text.text = "The love of his life dissapeared, the spot where she once was now empty."
		proceed = proceed + 1
	else:
		proceed = proceed + 1
		print("Proceed is equal to " + str(proceed))
