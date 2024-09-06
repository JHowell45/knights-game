extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var spawning: bool = true

func _process(delta: float) -> void:
	if spawning:
		sprite.play()
		spawning = false
