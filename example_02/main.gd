extends Spatial


onready var cam_world = $Camera
onready var cam_player = $InterpolatedCamera
#onready var cam_player = $"Player/Camera"
var current: bool


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_T:
			print("T was pressed")


func _ready():
	if !cam_world.current && !cam_player.current:
		cam_world.current = true
		current = true
	
	var iek_2 = InputEventKey.new()
	iek_2.scancode = KEY_C
	InputMap.add_action("ui_camera")
	InputMap.action_add_event("ui_camera", iek_2)


func _process(_delta):
	if Input.is_action_pressed("move_left"):
		print("T was pressed move_left")
	
	if Input.is_action_just_pressed("ui_camera"):
		if cam_world.current:
			cam_world.current = false
			cam_player.current = true
		else:
			cam_world.current = true
			cam_player.current = false
