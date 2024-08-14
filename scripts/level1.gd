extends Node2D

@onready var controls = $Controls

func key_label(action): 
	var key = InputMap.action_get_events(action)[0].physical_keycode
	return OS.get_keycode_string(key)

func _ready():
	var move_left_str = key_label("move_left")
	var move_right_str = key_label("move_right")
	var jump_str = key_label("jump")
	var attack_str = key_label("attack")
	
	controls.text = "Controls:
" + (move_left_str) + " to move left
" + (move_right_str) + " to move right
" + (jump_str) + " to jump
" + (attack_str) + " to attack"
	Global.lyre_pickup = false
