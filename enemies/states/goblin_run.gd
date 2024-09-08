class_name GoblinRun extends GoblinState

func enter(_state: StringName, _data := {}) -> void:
	pass
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	goblin.animator.play("Idle")

func handle_input(_event: InputEvent) -> void:
	pass
