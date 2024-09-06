extends CharacterBody2D

@export var speed: int
@export var attack: int

@onready var animator: AnimationPlayer = %AnimationPlayer
@onready var state = %CharacterState
@onready var sprite: Sprite2D = %Sprite2D
@onready var attack_timer: Timer = %Timer
@onready var environment_collision: CollisionShape2D = $EnvironmentCollision
@onready var hurt_box: Area2D = %HurtBox
@onready var direction = state.Direction.RIGHT

@onready var hit_box_top_col: CollisionShape2D = $HitBoxRightTop/HitBoxTopCol
@onready var hit_box_right_col: CollisionShape2D = $HitBoxRight/HitBoxRightCol
@onready var hit_box_bottom_col: CollisionShape2D = $HitBoxBottom/HitBoxBottomCol
@onready var hit_box_left_col: CollisionShape2D = $HitBoxLeft/HitBoxLeftCol

@onready var followers: Array = []
	

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * speed * delta
	move_and_slide()
	
	_handle_sprite_flip()
	_disable_hitboxes()
	if state.state != state.States.ATTACK:
		if velocity.is_zero_approx():
			state._set_state(state.States.IDLE, animator)
		else:
			state._set_state(state.States.RUN, animator)
	if Input.is_action_pressed("attack") and attack_timer.is_stopped():
		if velocity.x != 0 && velocity.y != 0:
			_enable_hitbox(state.Direction.LEFT)
			state._set_state(state.States.ATTACK, animator, state.Direction.LEFT)
		elif velocity.y < 0:
			_enable_hitbox(state.Direction.UP)
			state._set_state(state.States.ATTACK, animator, state.Direction.UP)
		elif velocity.y > 0:
			_enable_hitbox(state.Direction.DOWN)
			state._set_state(state.States.ATTACK, animator, state.Direction.DOWN)
		elif velocity.x > 0:
			_enable_hitbox(state.Direction.RIGHT)
			state._set_state(state.States.ATTACK, animator, state.Direction.LEFT)
		elif velocity.x < 0:
			_enable_hitbox(state.Direction.LEFT)
			state._set_state(state.States.ATTACK, animator, state.Direction.LEFT)
		else:
			_enable_hitbox(direction)
			state._set_state(state.States.ATTACK, animator, state.Direction.LEFT)
		attack_timer.start()
	#print(followers)
	#if followers:
		#print(followers[0])
	#print(global_position)

func _handle_sprite_flip():
	if velocity.x < 0:
			sprite.flip_h = true
			direction = state.Direction.LEFT
	elif velocity.x > 0:
		sprite.flip_h = false
		direction = state.Direction.RIGHT

func _disable_hitboxes() -> void:
	hit_box_top_col.disabled = true
	hit_box_right_col.disabled = true
	hit_box_left_col.disabled = true
	hit_box_bottom_col.disabled = true

func _enable_hitbox(direction) -> void:
	match direction:
		state.Direction.UP:
			hit_box_top_col.disabled = false
		state.Direction.RIGHT:
			hit_box_right_col.disabled = false
		state.Direction.LEFT:
			hit_box_left_col.disabled = false
		state.Direction.DOWN:
			hit_box_bottom_col.disabled = false

func _on_minion_following(rid: RID) -> void:
	followers.append(rid)
