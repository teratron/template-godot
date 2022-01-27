class_name ActionClass


var _action: String
var _code = []
var _input_event_key = [null, null]
var _input_event_action = [null, null]


var _input_event = {
	"key":    InputEventKey,
	"action": InputEventAction
}


func _init(action, code=[]):
	_action = action
	_code = code
	print(_input_event)
	
	InputMap.add_action(action)
	
	for i in len(code):
		_input_event_action[i] = InputEventAction.new()
		_input_event_action[i].action = action
		
		_input_event_key[i] = InputEventKey.new()
		_input_event_key[i].scancode = code[i]
		
		InputMap.action_add_event(action, _input_event_key[i])
	
	
	#var inputEventKey = InputEventKey.new()
	#inputEventKey.scancode = code[0]
	
	#_pressed = inputEventKey.pressed
	
	#InputMap.action_add_event(_action, inputEventKey)


#func _input(event):
	#print("Pressed move_backword", event)
	#if event is InputEventAction:
		#match event._action:
			#"move_backword":
			#	print("Pressed move_backword")
			#"move_backword2":
			#	print("Pressed move_backword2")
			#"ui_down":
			#	move_and_collide(Vecto3.DOWN)
			#"ui_right":
			#	move_and_collide(Vecto2.RIGHT) 
			#"ui_left":
			#	move_and_collide(Vecto2.LEFT)
			#_:
			#	pass
