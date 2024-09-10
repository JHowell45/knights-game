class_name GoblinAttack extends GoblinState

@onready var player: Player
@onready var hitboxes: Array

func enter(_state: StringName, data := {}) -> void:
	player = data["player"]
	hitboxes = [
		[goblin.hit_box_right, goblin.Direction.RIGHT],
		[goblin.hit_box_left, goblin.Direction.LEFT],
		[goblin.hit_box_up, goblin.Direction.UP],
		[goblin.hit_box_bottom, goblin.Direction.DOWN]
	]
	
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(delta: float) -> void:
	var gob_pos = goblin.global_position
	var player_pos = player.global_position
	for data in hitboxes:
		var hitbox = data[0]
		var direction = data[1]
		if _is_hittable(hitbox, player.global_position):
			match direction:
				goblin.Direction.LEFT:
					goblin.flip_left()
					goblin.animator.play("Attack_Right")
				goblin.Direction.RIGHT:
					goblin.flip_right()
					goblin.animator.play("Attack_Right")
				goblin.Direction.UP:
					goblin.animator.play("Attack_Up")
				goblin.Direction.DOWN:
					goblin.animator.play("Attack_Down")
			

func handle_input(_event: InputEvent) -> void:
	pass

func _on_hit_range_body_exited(body: Node2D) -> void:
	if body is Player:
		transition.emit(HUNT, {"player": player})

func _is_hittable(hitbox: Area2D, player_position: Vector2) -> bool:
	var col: CollisionShape2D = hitbox.get_children()[0]
	var col_pos: Vector2 = col.global_position
	var rect: Rect2 = col.shape.get_rect()
	var true_rect: Rect2 = Rect2(col_pos + rect.position, rect.size)
	var distance = goblin.global_position.direction_to(player_position)
	if true_rect.has_point(player_position):
		return true
	return false
