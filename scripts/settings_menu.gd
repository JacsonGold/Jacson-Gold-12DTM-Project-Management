extends Popup

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