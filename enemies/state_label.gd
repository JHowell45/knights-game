extends Label

var goblin: TorchGoblin
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await owner.ready
	goblin = owner


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = goblin.fsm.state.name
