class_name StateMachine extends Node


signal transitioned(state_name)

#export var initial_state := NodePath("/root/World/Player/ActionPlayer")
#onready var state: State = get_node(initial_state)

var state: State


func _ready():
	await owner.ready
	
	for child in get_children():
		child.state_machine = self
	
	if state != null:
		state.enter()


func _input(event):
	state.input(event)


func _unhandled_input(event):
	state.unhandled_input(event)


func _unhandled_key_input(event):
	state.unhandled_key_input(event)


func _process(delta):
	state.process(delta)


func _physics_process(delta):
	state.physics_process(delta)


func transition_to(target_state_name: String, msg: Dictionary = {}) -> void:
	if not has_node(target_state_name):
		return
	
	state.exit()
	state = get_node(target_state_name)
	state.enter(msg)
	emit_signal("transitioned", state.name)
