extends CharacterBody2D

@export var speed: int

@onready var animator: AnimationPlayer = %AnimationPlayer
@onready var state = %CharacterState

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * speed * delta
	move_and_slide()
	print(velocity)
	
	if state.state != state.States.ATTACK:
		if velocity.is_zero_approx():
			state._set_state(state.States.IDLE, animator)
		else:
			state._set_state(state.States.RUN, animator)
	if Input.is_action_pressed("attack"):
		if velocity.x != 0 && velocity.y != 0:
			state._set_state(state.States.ATTACK, animator, state.Direction.LEFT)
		elif velocity.y < 0:
			state._set_state(state.States.ATTACK, animator, state.Direction.UP)
		elif velocity.y > 0:
			state._set_state(state.States.ATTACK, animator, state.Direction.DOWN)
		else:
			state._set_state(state.States.ATTACK, animator, state.Direction.LEFT)
		
	print(animator.get_queue())

	
