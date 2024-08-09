extends Popup

@onready var labels = {
	"jump": $MarginContainer/VBoxContainer/RemapJump,
	"move_left": $MarginContainer/VBoxContainer/RemapMoveLeft,
	"move_right": $MarginContainer/VBoxContainer/RemapMoveRight,
	"attack": $MarginContainer/VBoxContainer/RemapAttack
}


var action_to_remap = ""
func _ready():
	# Connect the button's pressed signal to the function
	$MarginContainer/VBoxContainer/RemapJump.connect("pressed", _on_remap_jump_pressed)
	
func remap_action(action_name):
	action_to_remap = action_name
	labels[action_to_remap].text = "Press new keybind"

func _on_remap_jump_pressed():
	remap_action("jump")
	#print("remap jump")
	#action_to_remap = "jump"  # The action to remap
	#remap_jump.text = "press new keybind"
	
func _on_remap_move_left_pressed():
	remap_action("move_left")
	#print("remap left")
	#action_to_remap = "move_left"  # The action to remap

func _on_remap_move_right_pressed():
	remap_action("move_right")
	
func _on_remap_attack_pressed():
	remap_action("attack")





#func _process_input(event):
func _input(event):
	if action_to_remap != "":
		if event is InputEventKey and event.pressed:
			print("Keypressed " + event.as_text_key_label())
			
			# Remove the old binding
			for action_event in InputMap.action_get_events(action_to_remap):
				print("Removing " + str(action_event))
				InputMap.action_erase_event(action_to_remap, action_event)

			# Add the new binding
			InputMap.action_add_event(action_to_remap, event)
			labels[action_to_remap].text = str(event.as_text_key_label())
			
			
			# Stop listening for inputs after remapping
			action_to_remap = ""


#SOUND SETTINGS

# Music
func _on_volume_music_value_changed(value):
	AudioServer.set_bus_volume_db(1,value)
	
func _on_music_mute_check_box_toggled(toggled_on):
	AudioServer.set_bus_mute(1,toggled_on)


# SFX
func _on_volume_sfx_value_changed(value):
	AudioServer.set_bus_volume_db(2,value)

func _on_sfx_mute_music_box_toggled(toggled_on):
	AudioServer.set_bus_mute(2,toggled_on)




