class_name TorchGoblin extends CharacterBody2D

signal dead

signal take_damage(amount: int)

@export var max_health: int
@export var speed: int

@onready var sprite: Sprite2D = $Sprite2D
@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var player = get_node("/root/Game/TestLevel/Player")
@onready var nav: NavigationAgent2D = %NavigationAgent2D
@onready var direction
@onready var idle_timer: Timer = %IdleTimer
@onready var patrol_zone: Area2D = %PatrolZone
@onready var fsm: StateMachine = %StateMachine

func _on_hurt_box_area_entered(area: Area2D) -> void:
	take_damage.emit(area.get_parent().attack)

func _on_goblin_health_bar_dead() -> void:
	var pos = global_position
	queue_free()
	const GOLD = preload("res://resources/gold.tscn")
	var gold = GOLD.instantiate()
	gold.global_position = pos
	get_parent().add_child(gold)
