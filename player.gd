extends CharacterBody2D

@export var speed: int

@onready var animator: AnimationPlayer = %AnimationPlayer
@onready var state = %CharacterState
@onready var sprite: Sprite2D = %Sprite2D
@onready var attack_timer: Timer = %Timer


func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * speed * delta
	move_and_slide()
	
	if state.state != state.States.ATTACK:
		_handle_sprite_flip()
		if velocity.is_zero_approx():
			state._set_state(state.States.IDLE, animator)
		else:
			state._set_state(state.States.RUN, animator)
	if Input.is_action_pressed("attack") and attack_timer.is_stopped():
		if velocity.x != 0 && velocity.y != 0:
			state._set_state(state.States.ATTACK, animator, state.Direction.LEFT)
		elif velocity.y < 0:
			state._set_state(state.States.ATTACK, animator, state.Direction.UP)
		elif velocity.y > 0:
			state._set_state(state.States.ATTACK, animator, state.Direction.DOWN)
		else:
			state._set_state(state.States.ATTACK, animator, state.Direction.LEFT)
		attack_timer.start()

func _handle_sprite_flip():
	if velocity.x < 0:
			sprite.flip_h = true
	else:
		sprite.flip_h = false
