class_name GoblinIdle extends GoblinState

func enter(_state: StringName, _data := {}) -> void:
	goblin.velocity = Vector2.ZERO
	goblin.idle_timer.wait_time = randf_range(0.2, 1)
	goblin.idle_timer.start(randf_range(0.2, 1))
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	goblin.animator.play("Idle")
	await goblin.idle_timer.timeout
	transition.emit(PATROL)

func handle_input(_event: InputEvent) -> void:
	pass
