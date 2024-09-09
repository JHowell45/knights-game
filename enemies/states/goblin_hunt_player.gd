class_name GoblinHuntPlayer extends GoblinState

@onready var player: Player

func enter(_state: StringName, data := {}) -> void:
	player = data["player"]
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(delta: float) -> void:
	goblin.nav.set_target_position(player.global_position)
	if not goblin.nav.is_navigation_finished():
		goblin.animator.play("Run")
		var next_path = goblin.nav.get_next_path_position()
		var new_velocity = goblin.global_position.direction_to(next_path) * goblin.speed * delta
		if goblin.nav.avoidance_enabled:
			goblin.nav.set_velocity(new_velocity)
		else:
			_on_navigation_agent_2d_velocity_computed(new_velocity)
		goblin.move_and_slide()

func handle_input(_event: InputEvent) -> void:
	pass


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	goblin.velocity = safe_velocity
