class_name GoblinAttack extends GoblinState

@onready var player: Player

func enter(_state: StringName, data := {}) -> void:
	player = data["player"]
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(delta: float) -> void:
	var gob_pos = goblin.global_position
	var player_pos = player.global_position
	print(gob_pos.direction_to(player_pos))

func handle_input(_event: InputEvent) -> void:
	pass


func _on_hit_range_body_exited(body: Node2D) -> void:
	if body is Player:
		transition.emit(HUNT, {"player": player})
