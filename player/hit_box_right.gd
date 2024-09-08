extends Area2D

var player: Player

func _ready() -> void:
	await owner.ready
	player = owner

func _on_body_entered(body: Node2D) -> void:
	if body.has_signal('take_damage'):
		body.take_damage.emit(player.attack)
