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
		goblin.velocity = (next_path - goblin.global_position).normalized() * goblin.speed * delta
		goblin.move_and_slide()

func handle_input(_event: InputEvent) -> void:
	pass
