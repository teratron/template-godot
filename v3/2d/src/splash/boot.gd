extends Control


onready var animation = $AnimationPlayer


func _ready():
	#print(get_tree())
	animation.play("Fade In")
	yield(get_tree().create_timer(6), "timeout")
	animation.play("Fade Out")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://menu/main.tscn")
