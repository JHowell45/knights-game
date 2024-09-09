class_name GoblinPatrol extends GoblinState

@onready var angle: float
@onready var distance: float
@onready var random_point: Vector2

func enter(_state: StringName, _data := {}) -> void:
	_generate_random_path()
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(delta: float) -> void:
	goblin.animator.play("Run")
	if not goblin.nav.is_target_reachable():
		_generate_random_path()
	if goblin.nav.is_navigation_finished():
		transition.emit(IDLE)
	else:
		var next_path = goblin.nav.get_next_path_position()
		goblin.velocity = (next_path - goblin.global_position).normalized() * goblin.speed * delta
		goblin.move_and_slide()

func handle_input(_event: InputEvent) -> void:
	pass


func _on_vision_body_entered(body: Node2D) -> void:
	hunt_player(body)


func _on_vision_body_exited(body: Node2D) -> void:
	return_to_patrol(body)

func _generate_random_path() -> void:
	angle = randf_range(0, TAU)
	distance = randf_range(goblin.min_patrol_distance, goblin.max_patrol_distance)
	random_point = Vector2(goblin.global_position.x + distance * cos(angle), goblin.global_position.y + distance * sin(angle))
	goblin.nav.set_target_position(random_point)
