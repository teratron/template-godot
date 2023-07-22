extends Camera


func _process(_delta):
	look_at($'../Player'.translation, Vector3(0,1,0))
