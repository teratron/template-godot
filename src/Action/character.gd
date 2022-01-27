class_name ActionCharacter, "res://assets/minion.svg" extends Node


export var Rotate = 2
export var Gravity = -10
export var Speed = 500
export var Velocity = Vector3()


var ActionClass = load("res://src/Action/action.gd")
var action1 = ActionClass.new("move_backword", [KEY_0, KEY_1])
var action2 = ActionClass.new("move_backword2", [KEY_3, KEY_4])


#var isLeft:  bool
#var isRight: bool
#var isUp:    bool
#var isDown:  bool


#var action = {
	#"isLeft":  false,
	#"isRight": false,
	#"isUp":    false,
	#"isDown":  false,
#}


func _init():
	#print(action, code)
	pass


func _ready():
	print(action1._action, action1._code, action1._input_event_key, action1._input_event_action[0].action,"*")
	print(action2._action, action2._code, action2._input_event_key)

	#var action = Action.new()
	#for a in 4:
	
	#InputMap.add_action("move_left")
	#InputMap.add_action("move_right")
	#InputMap.add_action("move_forward")
	#InputMap.add_action("move_back")
	
	#var iek = InputEventKey.new()
	#iek.scancode = KEY_A
	#InputMap.add_action("ui_a")
	#InputMap.action_add_event("ui_a", iek)
	
	
	#var inputEvent = InputEvent.new()
	#InputMap.action_add_event("move_left", InputEvent.button_index(KEY_T))
	pass


func _process(_delta):
	#print(action1._action, action1._code, action1._input_event_key, action1._input_event_action[0].pressed)
	#print(action1._iek.pressed)
	pass

func _input(event):
	#print(event)
	#if event is InputEventKey:
		#print(event)
		#if event.action == action1._action:
			#print("Pressed move_backword", event)
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
	pass

func print_all():
	print("dddddddddddddddddddddd")
