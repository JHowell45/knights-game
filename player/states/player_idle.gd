class_name PlayerIdle extends PlayerState

@onready var direction: Vector2

func enter(_state: StringName, _data := {}) -> void:
	player.velocity = Vector2.ZERO
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	player.animator.play("Idle")
	direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		transition.emit(RUN, {'direction': direction})
		

func handle_input(_event: InputEvent) -> void:
	pass
