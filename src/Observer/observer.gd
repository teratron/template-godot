extends Spatial

#first person view FPV
#third person view TPV

func _init():
	pass


func _ready():
	print(add_camera("Camera 1"))
	print(add_interpolated_camera("InterpolatedCamera 4", true))


func add_camera(name: String = "Camera", current: bool = false) -> Camera:
	var camera = Camera.new()
	
	camera.name = name
	camera.current = current
	
	self.add_child(camera, true)
	return camera


func add_interpolated_camera(name: String = "InterpolatedCamera", current: bool = false) -> InterpolatedCamera:
	var camera = InterpolatedCamera.new()
	
	camera.name = name
	camera.target = NodePath("")
	camera.speed = 1
	camera.enabled = true
	camera.current = current
	
	self.add_child(camera, true)
	return camera


#func _process(delta):
#	pass
