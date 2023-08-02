class_name GravityPoint
extends Node

var point: Vector3
@export var strength: float = 9.8
@export var fixed: bool = true

var parent: Node = null

func _ready():
	await owner.ready
	parent = get_parent()
	print(parent)
