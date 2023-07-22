extends KinematicBody2D

onready var sprite = $AnimatedSprite
var velocity = Vector2(0,0)
const SPEED = 180
const GRAVITY = 35
const JUMPFORCE = -1100


func _physics_process(_delta):
	
	#if Input.is_action_just_released("ui_right"):
		#print("*************")
	
	
	
	#if Input.is_action_just_pressed("ui_right"):
		#sprite.play("idle")
		#sprite.flip_h = false
		
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		sprite.play("idle")
		if Input.is_action_just_released("ui_right"):
			sprite.play("idle")
		else:
			#velocity.x = SPEED
			sprite.play("walk")
	
	#elif Input.is_action_just_pressed("ui_left"):
		#sprite.play("idle")
		#sprite.flip_h = true
	
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		sprite.play("idle")
		if Input.is_action_just_released("ui_left"):
			sprite.play("idle")
		else:
			#velocity.x = -SPEED
			sprite.play("walk")
	
	else:
		sprite.play("idle")
	
	if not is_on_floor():
		sprite.play("air")
	
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	if Input.is_action_pressed("ui_crouch"):
		velocity.y = SPEED
		sprite.play("crouch")
	
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, .2)
