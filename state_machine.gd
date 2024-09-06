class_name StateMachine
extends Node

@export var current_state: State

var states : Dictionary = {}

func _ready() -> void:
	for state in get_children():
		if state is State:
			states[state.name] = state
			state.state_changed.connect(_on_state_changed)
		else:
			push_warning("Invalid node! Should be of type State!")
	current_state._enter()
			
func _on_state_changed() -> void:
	pass
