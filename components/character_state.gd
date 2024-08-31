extends Node

enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	NONE
}

enum States {
	IDLE,
	RUN,
	ATTACK,
	HIT,
	DEAD
}

@export var state: States

func _set_state(new_state: States, animator: AnimationPlayer, direction: Direction = Direction.NONE):
	state = new_state
	match (state):
		States.IDLE:
			idle(animator)
		States.RUN:
			running(animator)
		States.ATTACK:
			attacking(animator, direction)
		States.HIT:
			hit(animator)
		States.DEAD:
			dead(animator)

func idle(animator: AnimationPlayer):
	animator.play("Idle")
	
func running(animator: AnimationPlayer):
	animator.play("Run")
	
func attacking(animator: AnimationPlayer, direction: Direction):
	var animation_index: int
	match direction:
		Direction.UP:
			animation_index = 5
		Direction.DOWN:
			animation_index = 3
		Direction.LEFT:
			animation_index = 1
		Direction.RIGHT:
			animation_index = 1
	animator.play("Attack_%d" % animation_index)
	await animator.animation_finished
	_set_state(States.IDLE, animator)
	
func hit(animator: AnimationPlayer):
	animator.play("Idle")
	
func dead(animator: AnimationPlayer):
	animator.play("Idle")
