extends Node3D


func _ready():
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	GlobalVariables.game_active = true


func _input(_event):
	if Input.is_action_just_pressed("ui_end"):
		var pause_menu_scene = load("res://menus/pause/pause_menu.tscn")
		var pause_menu_instance = pause_menu_scene.instantiate()
		$PauseMenu.add_child(pause_menu_instance)
		get_tree().paused = true
