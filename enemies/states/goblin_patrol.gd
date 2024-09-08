class_name GoblinPatrol extends GoblinState

@onready var area: Rect2
@onready var random_point: Vector2

func enter(_state: StringName, _data := {}) -> void:
	area = goblin.patrol_zone.get_children()[0].shape.get_rect()
	var start = area.position
	var end = area.end
	
	random_point = Vector2(randf_range(start[0], end[0]), randf_range(start[1], end[1]))
	print(random_point)
	goblin.nav.set_target_position(random_point)
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(delta: float) -> void:
	goblin.animator.play("Run")
	if goblin.nav.is_navigation_finished():
		transition.emit(IDLE)
	else:
		var next_path = goblin.nav.get_next_path_position()
		goblin.velocity = (next_path - goblin.global_position).normalized() * goblin.speed * delta
		goblin.move_and_slide()

func handle_input(_event: InputEvent) -> void:
	pass
