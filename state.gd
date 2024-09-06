class_name State
extends Node

signal state_changed(new_state: StringName)

# Actions to perform when entering this state.
func _enter() -> void:
	pass

# Actions to perform when exiting this state.
func _exit() -> void:
	pass

# Actions to perform when updating the frame in this state.
func _update(delta: float) -> void:
	pass

# Actions to perform when updating the physics for a frame in this state.
func _physics_update(delta: float) -> void:
	pass
