extends Control


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _input(_event):
	if Input.is_action_just_pressed("ui_end"):
		#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		await get_tree().process_frame
		get_tree().paused = false
		queue_free()


func _on_resume_button_pressed():
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().paused = false
	queue_free()


func _on_settings_button_pressed():
	var settings_menu_scene = load("res://menus/settings/settings_menu.tscn")
	var settings_menu_instance = settings_menu_scene.instantiate()
	get_parent().add_child(settings_menu_instance)
	queue_free()


func _on_quit_button_pressed():
	get_tree().paused = false
	var main_menu_scene = load("res://menus/main/main_menu.tscn")
	get_tree().change_scene_to_packed(main_menu_scene)
