extends CharacterBody2D

@export var speed: int

@onready var state = %CharacterState

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * speed * delta
	move_and_slide()
	print(velocity)
