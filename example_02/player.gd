extends KinematicBody


const ROTATE = 2
const GRAVITY = -10
const SPEED = 500
var vel = Vector3()


#var ac = ActionControl.new()


func _ready():
	pass


func _process(delta):
	#rotation.y += 0.1
	#rotate(Vector3(0,1,0), 0.1)
	#rotate_x(0.2)
	#rotate_y(0.1)
	#rotate_z(0.05)

	#translation.z -= 0.05
	#translate(Vector3(0,0,-0.05))
	
	var dir = Vector3()
	var rot = ROTATE * delta
	#var spd = SPEED * delta
	
	var isActionLeft  = Input.is_action_pressed("ui_left")
	var isActionRight = Input.is_action_pressed("ui_right")
	var isActionUp    = Input.is_action_pressed("ui_up")
	var isActionDown  = Input.is_action_pressed("ui_down")
	#print(isActionLeft, " ", isActionRight, " ", isActionUp, " ", isActionDown)
	#print(Input.is_action_pressed("ui_left"), " ", Input.is_action_pressed("ui_right"), " ", Input.is_action_pressed("ui_up"), " ", Input.is_action_pressed("ui_down"))
	
	if isActionLeft && !isActionRight:
			rotate_y(rot)
	elif isActionRight && !isActionLeft:
			rotate_y(-rot)
	
	if isActionUp && !isActionDown:
		dir.z = -1
	elif isActionDown && !isActionUp:
		dir.z = 1
	
	#if Input.is_action_pressed("ui_left"):
		#dir.x = -1
		#rotate_y(rot)
	#elif Input.is_action_pressed("ui_right"):
		#dir.x = 1
		#rotate_y(-rot)
	
	#if Input.is_action_pressed("ui_up"):
		#dir.z = -1
		#translate(Vector3(0,0,-spd))
	#elif Input.is_action_pressed("ui_down"):
		#dir.z = 1
		#translate(Vector3(0,0,spd))
	
	if dir:
		dir *= SPEED * delta
		#translate(dir)
		dir = dir.rotated(Vector3(0,1,0), rotation.y)
	
	vel.x = dir.x
	vel.z = dir.z
	vel.y += GRAVITY * delta
	vel = move_and_slide(vel, Vector3(0,1,0))


func _physics_process(_delta):
	$Camera.look_at(translation, Vector3(0,1,0))
		
