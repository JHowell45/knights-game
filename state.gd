class_name State extends Node

signal transition(next_state: StringName, data: Dictionary)

func enter(_state: StringName, _data := {}) -> void:
	pass
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	pass

func handle_input(_event: InputEvent) -> void:
	pass
