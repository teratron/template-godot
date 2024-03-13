extends KinematicBody2D


onready var animation = $AnimatedSprite


func _ready():
	animation.play("walk_down")


func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_down"):
		animation.play("walk_down")
	elif Input.is_action_just_pressed("ui_up"):
		animation.play("walk_up")
	elif Input.is_action_just_pressed("ui_right"):
		animation.play("walk_right")
	elif Input.is_action_just_pressed("ui_left"):
		animation.play("walk_left")
	elif Input.is_action_just_pressed("ui_accept"):
		animation.play("toggle_hat")


func _toggle_hat_visible():
	$Hat.visible = !$Hat.visible
