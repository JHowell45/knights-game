class_name PlayerIdle extends PlayerState

func enter(_state: StringName, _data := {}) -> void:
	pass
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	player.animator.play("Idle")

func handle_input(_event: InputEvent) -> void:
	pass
