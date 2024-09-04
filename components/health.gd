extends Node

@export var min_health: int
@export var max_health: int
@export var parent: TextureProgressBar = get_parent()

func _ready() -> void:
	print(parent)
	#parent.max_value = maxas_health
	#parent.min_value = min_health

func _process(delta: float) -> void:
	pass
	
func take_damage(amount: int) -> void:
	parent.value -= amount
	
func heal(amount: int) -> void:
	parent.value += amount
