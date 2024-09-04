extends Area2D

signal attack(enemy: CharacterBody2D)

@onready var attacking: bool = false
@onready var enemy_distance: float = INF
@onready var enemy: CharacterBody2D


func _physics_process(delta: float) -> void:
	for body in get_overlapping_bodies():
		if body.is_in_group("Knights") and body != enemy:
			var distance = global_position.distance_to(body.global_position)
			print(distance)
			if enemy_distance > distance:
				enemy_distance = distance
				enemy = body
	if enemy:
		attack.emit(enemy)
