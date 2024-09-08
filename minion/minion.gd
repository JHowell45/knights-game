extends CharacterBody2D

signal following(rid: RID)

@export var speed: int

@onready var state = %MinionState
@onready var animator: AnimationPlayer = %AnimationPlayer
@onready var nav: NavigationAgent2D = $NavigationAgent2D

@onready var is_following: bool = false

@onready var player = get_node("/root/Game/TestLevel/Player")

const DISTANCE: int = 50

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	if is_following:
		var new_position = player.environment_collision.global_position
		if (player.direction == player.state.Direction.LEFT):
			new_position.x += DISTANCE
		if (player.direction == player.state.Direction.RIGHT):
			new_position.x -= DISTANCE
		nav.target_position = new_position
		
		if not nav.is_navigation_finished():
			var current_nav_position = global_position
			var next_path_position = nav.get_next_path_position()
			var new_velocity = current_nav_position.direction_to(next_path_position) * speed * delta
		
			if nav.avoidance_enabled:
				nav.set_velocity(new_velocity)
			else:
				_on_navigation_agent_2d_velocity_computed(new_velocity)
		move_and_slide()
		
	#if velocity.is_zero_approx():
		#state._set_state(state.States.IDLE, animator)
	#else:
		#state._set_state(state.States.RUN, animator)


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action("left_click") and event.is_pressed() and not is_following:
		is_following = true
		following.emit(get_rid())


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
