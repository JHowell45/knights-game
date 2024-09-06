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
	current_state.enter()
	
func _process(delta) -> void:
	current_state.update(delta)
	
func _physics_process(delta) -> void:
	current_state.physics_update(delta)
			
func _on_state_changed(new_state: StringName) -> void:
	var next_state = states.get(new_state)
	
	if next_state and next_state != current_state:
		current_state.exit()
		next_state.enter()
		current_state = next_state
	else:
		push_error(("Invalid state: '%s'" % new_state))
