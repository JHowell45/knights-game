extends CharacterBody2D

@export var speed: int

@onready var animator: AnimationPlayer = %AnimationPlayer
@onready var state = %CharacterState

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * speed * delta
	move_and_slide()
	print(velocity)
	
	if velocity.is_zero_approx():
		state._set_state(state.States.IDLE, animator)
	else:
		state._set_state(state.States.RUNNING, animator)
		
	print(animator.get_queue())

	
