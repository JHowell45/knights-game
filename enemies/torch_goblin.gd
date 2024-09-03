extends CharacterBody2D

signal dead

@export var health: int

func _physics_process(delta: float) -> void:
	print("health: %d" % health)

func _on_hurt_box_area_entered(area: Area2D) -> void:
	var damage = area.get_parent().attack
	health -= damage
	if health <= 0:
		dead.emit()
		queue_free()
