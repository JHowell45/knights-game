class_name PlayerRun extends PlayerState

func enter(_state: StringName, data := {}) -> void:
	player.velocity = data.get('direction') * player.speed
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(delta: float) -> void:
	player.animator.play("Run")
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction.is_zero_approx():
		transition.emit(IDLE)
	player.velocity = direction * player.speed * delta
	player.move_and_slide()

func handle_input(_event: InputEvent) -> void:
	pass
