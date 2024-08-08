extends Control

@onready var settings_menu = $SettingsMenu

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/intro_cutscene.tscn")


func _on_options_pressed():
	settings_menu.visible = true
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
