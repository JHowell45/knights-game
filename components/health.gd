extends Node

signal update_current_health(current: int)

@export var min_health: int
@export var max_health: int
@onready var current: int = max_health


func _take_damage(amount: int):
	current -= amount
	update_current_health.emit(current)


func _heal(amount: int):
	current += amount
	update_current_health.emit(current)
