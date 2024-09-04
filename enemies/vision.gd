extends Area2D

func _physics_process(delta: float) -> void:
	if get_overlapping_bodies():
		print(get_overlapping_bodies())
