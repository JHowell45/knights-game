class_name GoblinAttack extends GoblinState

@onready var player: Player
@onready var hurtbox: Area2D
@onready var hitboxes: Array

func enter(_state: StringName, data := {}) -> void:
	player = data["player"]
	hurtbox = data["player_hurtbox"]
	hitboxes = [
		[goblin.hit_box_left, goblin.Direction.LEFT],
		[goblin.hit_box_right, goblin.Direction.RIGHT],
		[goblin.hit_box_up, goblin.Direction.UP],
		[goblin.hit_box_bottom, goblin.Direction.DOWN]
	]
	
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(delta: float) -> void:
	var gob_pos = goblin.global_position
	#var player_pos = player.global_position
	for data in hitboxes:
		var hitbox = data[0]
		var direction = data[1]
		if _is_hittable(hitbox, hurtbox):
			var animation: StringName
			match direction:
				goblin.Direction.LEFT:
					goblin.flip_left()
					animation = "Attack_Right"
				goblin.Direction.RIGHT:
					goblin.flip_right()
					animation = "Attack_Right"
				goblin.Direction.UP:
					animation = "Attack_Up"
				goblin.Direction.DOWN:
					animation = "Attack_Down"
			goblin.animator.play(animation)
			await goblin.animator.animation_finished
			

func handle_input(_event: InputEvent) -> void:
	pass

func _is_hittable(hitbox: Area2D, hurtbox: Area2D) -> bool:
	print(hurtbox)
	#var col: CollisionShape2D = hitbox.get_children()[0]
	#var collision_global_position: Vector2 = col.global_position
	#var rect: Rect2 = col.shape.get_rect()
	#print(rect.size / 2)
	#print("position: ", hitbox.position)
	#print("global position: ", hitbox.global_position)
	#print(hitbox.shape_owner_get_transform(0).origin)
	#print(hitbox.shape_owner_get_transform(0).origin - rect.size / 2)
	#var true_rect: Rect2 = Rect2(col.global_position - rect.size / 2, rect.size)
	#print("col.position: ", col.position)
	#print("collision_global_position: ", collision_global_position)
	#print("rect.position: ", rect.position)
	#print("rect.end: ", rect.end)
	#var true_rect: Rect2 = Rect2(collision_global_position + rect.position, rect.size)
	#var true_rect_2: Rect2 = Rect2(goblin.global_position + rect.position, rect.size)
	#print("rect: ", rect)
	#print("rect has point: ", rect.has_point(player_position))
	#print("true_rect: ", true_rect)
	#print("true_rect has point: ", true_rect.has_point(player_position))
	#print("true_rect_2: ", true_rect_2)
	#print("true_rect_2 has point: ", true_rect_2.has_point(player_position))
	#var distance = goblin.global_position.direction_to(player_position)
	#if true_rect.has_point(player_position):
		#return true
	return false


func _on_hit_range_area_exited(area: Area2D) -> void:
	if area.name == "HurtBox":
		transition.emit(HUNT, {"player": player})
