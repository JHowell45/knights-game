extends StaticBody2D

@onready var animator: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	animator.play("Idle")
