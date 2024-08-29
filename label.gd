extends Label

@onready var state = %CharacterState

func _physics_process(delta: float) -> void:
	text = state.States.find_key(state.state)
