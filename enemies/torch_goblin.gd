extends CharacterBody2D

func _physics_process(delta: float) -> void:
	pass


func _on_hurt_box_area_entered(area: Area2D) -> void:
	print("HIT 1")


func _on_hurt_box_body_entered(body: Node2D) -> void:
	print("HIT 2")


func _on_hurt_box_mouse_entered() -> void:
	print("MOUSE")


func _on_hurt_box_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	print("HIT 3")
