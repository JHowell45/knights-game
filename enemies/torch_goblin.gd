extends CharacterBody2D

signal dead

@export var health: int

func _on_hurt_box_area_entered(area: Area2D) -> void:
	var damage = area.get_parent().attack
	health -= damage
	if health <= 0:
		dead.emit()


func _on_dead() -> void:
	var pos = global_position
	queue_free()
	const DEATH = preload("res://death.tscn")
	var death = DEATH.instantiate()
	death.global_position = pos
	get_parent().add_child(death)
