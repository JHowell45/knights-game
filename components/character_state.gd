extends Node

enum States {
	IDLE,
	RUNNING,
	ATTACKING,
	HIT,
	DEAD
}

@export var state: States

func _set_state(state: States, animator: AnimationPlayer):
	pass
