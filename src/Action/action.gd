class_name Action


var pressed: bool = false
var action: String
var code: int


func _init():
	var inputEventKey = InputEventKey.new()
	inputEventKey.scancode = code
	InputMap.add_action(action)
	InputMap.action_add_event(action, inputEventKey)
