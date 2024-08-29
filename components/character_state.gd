extends Node

enum States {
	IDLE,
	RUNNING,
	ATTACKING,
	HIT,
	DEAD
}

@export var state: States
