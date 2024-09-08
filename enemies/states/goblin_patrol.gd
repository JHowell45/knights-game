class_name GoblinPatrol extends GoblinState

func enter(_state: StringName, _data := {}) -> void:
	var area: Rect2 = goblin.patrol_zone.get_children()[0].shape.get_rect()
	var start = area.position
	var end = area.end
	
	var random_point: Vector2 = Vector2(randf_range(start[0], end[0]), randf_range(start[1], end[1]))
	print(random_point)
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	goblin.animator.play("Run")
	transition.emit(IDLE)

func handle_input(_event: InputEvent) -> void:
	pass
