extends CharacterBody2D

signal dead

signal take_damage(amount: int)

@export var max_health: int

func _on_hurt_box_area_entered(area: Area2D) -> void:
	take_damage.emit(area.get_parent().attack)


func _on_goblin_health_bar_dead() -> void:
	var pos = global_position
	queue_free()
	const DEATH = preload("res://death.tscn")
	var death = DEATH.instantiate()
	death.global_position = pos
	get_parent().add_child(death)
