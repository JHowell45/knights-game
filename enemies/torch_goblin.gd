extends CharacterBody2D

func _physics_process(delta: float) -> void:
	pass


func _on_hurt_box_area_entered(area: Area2D) -> void:
	print("HIT")
