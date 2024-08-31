extends Label

@onready var health = %Health

func _physics_process(delta: float) -> void:
	text = "%d" % health.health
