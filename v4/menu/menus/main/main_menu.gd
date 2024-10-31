extends Control


func _ready():
	GlobalVariables.game_active = false
	SettingsManager.load_config()


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://game_scene.tscn")


func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://menus/settings/settings_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
