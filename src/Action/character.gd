class_name ActionCharacter, "res://assets/earth.svg" extends Node


export var Rotate = 2
export var GRAVITY = -10
export var Speed = 500
export var vel = Vector3()


#class MovementAction:
var Action = load("action.gd")
var movementAction = Action.new()


var isLeft:  bool
var isRight: bool
var isUp:    bool
var isDown:  bool


var action = {
	"isLeft":  false,
	"isRight": false,
	"isUp":    false,
	"isDown":  false,
}


func _init():
	pass



func _ready():
	#var action = Action.new()
	#for a in 4:
	
	InputMap.add_action("move_left")
	InputMap.add_action("move_right")
	InputMap.add_action("move_forward")
	InputMap.add_action("move_back")
	
	var iek = InputEventKey.new()
	iek.scancode = KEY_A
	InputMap.add_action("ui_a")
	InputMap.action_add_event("ui_a", iek)
	
	
	#var inputEvent = InputEvent.new()
	#InputMap.action_add_event("move_left", InputEvent.button_index(KEY_T))
	pass


#func _process(delta):
#	pass

#func _input(event):
	#if event is InputEventAction:
		#match event.action:
			#"ui_up":
			#	move_and_collide(Vecto3.UP)
			#"ui_down":
			#	move_and_collide(Vecto3.DOWN)
			#"ui_right":
			#	move_and_collide(Vecto2.RIGHT) 
			#"ui_left":
			#	move_and_collide(Vecto2.LEFT)
			#_:
			#	pass


func print_all():
	print("dddddddddddddddddddddd")
