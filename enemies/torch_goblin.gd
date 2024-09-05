extends CharacterBody2D

signal dead

signal take_damage(amount: int)

@export var max_health: int
@export var speed: int

@onready var attacking: bool = false
@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var player = get_node("/root/Game/TestLevel/Player")
@onready var nav: NavigationAgent2D = %NavigationAgent2D

func _ready() -> void:
	animator.play("Idle")
	
func _physics_process(delta: float) -> void:
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
	

func _on_hurt_box_area_entered(area: Area2D) -> void:
	take_damage.emit(area.get_parent().attack)


func _on_goblin_health_bar_dead() -> void:
	var pos = global_position
	queue_free()
	const DEATH = preload("res://death.tscn")
	var death = DEATH.instantiate()
	death.global_position = pos
	get_parent().add_child(death)


func _on_vision_attack(enemy: CharacterBody2D) -> void:
	attacking = true


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
