class_name GoblinAttack extends GoblinState

@onready var player: Player

func enter(_state: StringName, data := {}) -> void:
	player = data["player"]
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(delta: float) -> void:
	pass

func handle_input(_event: InputEvent) -> void:
	pass


func _on_hit_range_body_exited(body: Node2D) -> void:
	transition.emit(HUNT, {"player": player})
