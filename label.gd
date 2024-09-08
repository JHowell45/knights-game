class_name StateLabel extends Label

@onready var fsm: StateMachine = %StateMachine

func _physics_process(delta: float) -> void:
	text = fsm.state.name
