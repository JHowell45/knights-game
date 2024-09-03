extends Area2D

func _ready() -> void:
	var animator: AnimationPlayer = %AnimationPlayer
	animator.play("Dead")
	await animator.animation_finished
	animator.play("Buried")
	await animator.animation_finished
	queue_free()
