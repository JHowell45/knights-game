class_name GoblinState extends State

const IDLE = "GoblinIdle"
const PATROL = "GoblinPatrol"
const HUNT = "GoblinHuntPlayer"
const ATTACK = "GoblinAttack"

var goblin: TorchGoblin

func _ready() -> void:
	await owner.ready
	goblin = owner as TorchGoblin
	assert(goblin != null, "The PlayerState state type must be used only in the goblin scene. It needs the owner to be a Player node.")


func hunt_player(body: Node2D) -> void:
	if body is Player:
		transition.emit(HUNT, {"player": body})

func return_to_patrol(body: Node2D) -> void:
	if body is Player:
		transition.emit(IDLE)
