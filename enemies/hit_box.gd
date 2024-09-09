class_name GoblinHitBox extends Area2D

var goblin: TorchGoblin

func _ready() -> void:
	await owner.ready
	goblin = owner

func _on_body_entered(body: Node2D) -> void:
	_take_damage(body)


func _take_damage(body: Node2D) -> void:
	if body.has_signal('take_damage'):
			body.take_damage.emit(goblin.attack)
