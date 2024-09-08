class_name PlayerAttack extends PlayerState

@onready var direction: Vector2
@onready var attack_switch: bool = false

func enter(_state: StringName, _data := {}) -> void:
	pass
	
func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	_handle_attack()
	await player.animator.animation_finished
	if Input.get_vector("left", "right", "up", "down").is_zero_approx():
		transition.emit(IDLE)
	else:
		transition.emit(RUN)

func handle_input(_event: InputEvent) -> void:
	pass

func _handle_attack():
	var digit := 1
	match player.direction:
		player.Direction.UP:
			digit = 5
		player.Direction.DOWN:
			digit = 3
		player.Direction.LEFT:
			pass
		player.Direction.RIGHT:
			pass
	digit += int(attack_switch)
	attack_switch = not attack_switch
	player.animator.play("Attack_%d" % digit)
