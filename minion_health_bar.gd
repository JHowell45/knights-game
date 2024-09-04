extends TextureProgressBar

func _ready() -> void:
	max_value = %Health.max_health
	print(max_value)
