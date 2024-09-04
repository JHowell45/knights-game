extends TextureProgressBar

signal dead

func _ready() -> void:
	var goblin = get_parent()
	max_value = goblin.max_health
	value = max_value
	
func _process(delta: float) -> void:
	if value == max_value or value == 0:
		visible = false
	else:
		visible = true

func _on_torch_goblin_take_damage(amount: int) -> void:
	value -= amount
	if value == 0:
		dead.emit()
