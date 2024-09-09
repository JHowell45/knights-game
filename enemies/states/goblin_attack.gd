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
