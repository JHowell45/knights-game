extends TextureProgressBar

func _ready() -> void:
	max_value = %Health.health
	print(max_value)
