class_name State extends Node


var state_machine = null
var state_parent  = null


func _ready():
	await owner.ready
	state_parent = get_parent()
	assert(state_parent != null)


func input(_event: InputEvent) -> void:
	pass


func unhandled_input(_event: InputEvent) -> void:
	pass


func unhandled_key_input(_event: InputEventKey) -> void:
	pass


func process(_delta: float) -> void:
	pass


func physics_process(_delta: float) -> void:
	pass


# Called by the state machine upon changing the active state. The `msg` parameter
# is a dictionary with arbitrary data the state can use to initialize itself.
func enter(_msg := {}) -> void:
	pass


# Called by the state machine before changing the active state. Use this function
# to clean up the state.
func exit() -> void:
	pass
