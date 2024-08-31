extends CharacterBody2D

@export var speed: int

@onready var state = %MinionState
@onready var animator: AnimationPlayer = %AnimationPlayer

@onready var following: bool = false

@onready var player = get_node("/root/Game/Player")

const DISTANCE: int = 50

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	if following:
		var player_pos = player.global_position
		print("x: %d" % abs(global_position.x - player_pos.x))
		print("y: %d" % abs(global_position.y - player_pos.y))
		direction = global_position.direction_to(player_pos)
		
		if abs(global_position.x - player_pos.x) > DISTANCE and abs(global_position.y - player_pos.y) > DISTANCE:
			pass
		elif abs(global_position.x - player_pos.x) > DISTANCE:
			direction = global_position.direction_to(player_pos)
			direction.y = 0
		elif abs(global_position.y - player_pos.y) > DISTANCE:
			direction = global_position.direction_to(player_pos)
			direction.x = 0
		else:
			direction = Vector2.ZERO
		velocity = direction * speed * delta
		move_and_slide()
	if velocity.is_zero_approx():
		state._set_state(state.States.IDLE, animator)
	else:
		state._set_state(state.States.RUN, animator)


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action("left_click") and event.is_pressed() and not following:
		following = true
