class_name StateMachine extends Node

@export var state: State

func _ready() -> void:
	for state_node: State in find_children("*", "State"):
		state_node.transition_state.connect(_to_next_state)
	await owner.ready
	state.enter("")

func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)
	
func _process(delta: float) -> void:
	state.update(delta)
	
func _physics_process(delta: float) -> void:
	state.physics_update(delta)

func _to_next_state(next_state: String, data := {}) -> void:
	if not has_node(next_state):
		var msg = "State '%s' does not exist!" % next_state
		push_error(msg)
		print(msg)
		return
	var prev_state = state.name
	print("Prev State: %s" % prev_state)
	state.exit()
	state = get_node(next_state)
	print("New State: %s" % state)
	state.enter(prev_state, data)
