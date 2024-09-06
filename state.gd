class_name State
extends Node

signal state_changed(new_state: StringName)

# Actions to perform when entering this state.
func enter() -> void:
	pass

# Actions to perform when exiting this state.
func exit() -> void:
	pass

# Actions to perform when updating the frame in this state.
func update(delta: float) -> void:
	pass

# Actions to perform when updating the physics for a frame in this state.
func physics_update(delta: float) -> void:
	pass
