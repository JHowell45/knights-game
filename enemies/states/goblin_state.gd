class_name GoblinState extends State

const IDLE = "GoblinIdle"
const PATROL = "GoblinPatrol"

var goblin: TorchGoblin

func _ready() -> void:
	await owner.ready
	goblin = owner as TorchGoblin
	assert(goblin != null, "The PlayerState state type must be used only in the goblin scene. It needs the owner to be a Player node.")
