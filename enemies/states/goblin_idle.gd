class_name GoblinIdle extends GoblinState

func enter(_state: StringName, _data := {}) -> void:
	goblin.velocity = Vector2.ZERO
	goblin.idle_timer.start(randf_range(goblin.min_idle_time, goblin.max_idle_time))
	
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


func _on_vision_body_entered(body: Node2D) -> void:
	hunt_player(body)
