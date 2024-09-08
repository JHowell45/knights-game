extends CharacterBody2D

signal dead

signal take_damage(amount: int)

@export var max_health: int
@export var speed: int

@onready var attacking: bool = false
@onready var attack: bool = false
@onready var sprite: Sprite2D = $Sprite2D
@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var player = get_node("/root/Game/TestLevel/Player")
@onready var nav: NavigationAgent2D = %NavigationAgent2D
@onready var state: Node = %GoblinState
@onready var direction
@onready var attack_direction

@onready var hit_box_right_col: CollisionShape2D = $HitBoxRight/HitBoxRightCol
@onready var hit_box_left_col: CollisionShape2D = $HitBoxLeft/HitBoxLeftCol
@onready var hit_box_up_col: CollisionShape2D = $HitBoxUp/HitBoxUpCol
@onready var hit_box_down_col: CollisionShape2D = $HitBoxDown/HitBoxDownCol

func _ready() -> void:
	animator.play("Idle")
	
func _physics_process(delta: float) -> void:
	_handle_sprite_flip()
	_disable_hitboxes()
	if attacking:
		var new_position = player.global_position
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

func _handle_sprite_flip():
	if velocity.x < 0:
			sprite.flip_h = true
			direction = state.Direction.LEFT
	elif velocity.x > 0:
		sprite.flip_h = false
		direction = state.Direction.RIGHT
		
func _disable_hitboxes() -> void:
	hit_box_up_col.disabled = true
	hit_box_right_col.disabled = true
	hit_box_left_col.disabled = true
	hit_box_down_col.disabled = true

func _enable_hitbox(direction) -> void:
	match direction:
		state.Direction.UP:
			hit_box_up_col.disabled = false
		state.Direction.RIGHT:
			hit_box_right_col.disabled = false
		state.Direction.LEFT:
			hit_box_left_col.disabled = false
		state.Direction.DOWN:
			hit_box_down_col.disabled = false

func _on_hurt_box_area_entered(area: Area2D) -> void:
	take_damage.emit(area.get_parent().attack)


func _on_goblin_health_bar_dead() -> void:
	var pos = global_position
	queue_free()
	const GOLD = preload("res://resources/gold.tscn")
	var gold = GOLD.instantiate()
	gold.global_position = pos
	get_parent().add_child(gold)


func _on_vision_attack(enemy: CharacterBody2D) -> void:
	attacking = true


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity


func _on_hit_box_right_body_entered(body: Node2D) -> void:
	print(body)
