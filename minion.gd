extends CharacterBody2D

@onready var state = %MinionState
@onready var animator: AnimationPlayer = %AnimationPlayer

func _physics_process(delta: float) -> void:
	if velocity.is_zero_approx():
		state._set_state(state.States.IDLE, animator)
	else:
		state._set_state(state.States.RUN, animator)
