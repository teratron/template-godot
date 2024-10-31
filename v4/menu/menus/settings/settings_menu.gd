extends Control


func _ready():
	$FullscreenButton.set_pressed_no_signal(SettingsManager.fullscreen)
	$MasterVolumeSlider.value = SettingsManager.master_volume
	$MusicVolumeSlider.value = SettingsManager.music_volume
	$EffectsVolumeSlider.value = SettingsManager.effects_volume
	$VoicesVolumeSlider.value = SettingsManager.voices_volume


func _on_back_button_pressed():
	SettingsManager.save_config()
	if GlobalVariables.game_active:
		var pause_menu_scene = load("res://menus/pause/pause_menu.tscn")
		var pause_menu_instance = pause_menu_scene.instantiate()
		get_parent().add_child(pause_menu_instance)
		queue_free()
	else:
		get_tree().change_scene_to_file("res://menus/main/main_menu.tscn")


func _on_fullscreen_button_toggled(button_pressed):
	SettingsManager.fullscreen = button_pressed
	SettingsManager.initialize_video()


func _on_master_volume_slider_value_changed(value):
	$MasterVolumeSlider/Label.text = str(value)
	SettingsManager.master_volume = value
	SettingsManager.initialize_audio()


func _on_music_volume_slider_value_changed(value):
	$MusicVolumeSlider/Label.text = str(value)
	SettingsManager.music_volume = value
	SettingsManager.initialize_audio()


func _on_effects_volume_slider_value_changed(value):
	$EffectsVolumeSlider/Label.text = str(value)
	SettingsManager.effects_volume = value
	SettingsManager.initialize_audio()


func _on_voices_volume_slider_value_changed(value):
	$VoicesVolumeSlider/Label.text = str(value)
	SettingsManager.voices_volume = value
	SettingsManager.initialize_audio()


func _on_master_volume_slider_drag_ended(_value_changed):
	AudioManager.play_test_sfx("Master")


func _on_music_volume_slider_drag_ended(_value_changed):
	AudioManager.play_test_sfx("Music")


func _on_effects_volume_slider_drag_ended(_value_changed):
	AudioManager.play_test_sfx("Effects")


func _on_voices_volume_slider_drag_ended(_value_changed):
	AudioManager.play_test_sfx("Voices")
