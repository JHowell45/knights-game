extends Node

enum States {
	IDLE,
	RUNNING,
	ATTACKING,
	HIT,
	DEAD
}

@export var state: States

func _set_state(new_state: States, animator: AnimationPlayer):
	state = new_state
	match (state):
		States.IDLE:
			idle(animator)
		States.RUNNING:
			running(animator)
		States.ATTACKING:
			attacking(animator)
		States.HIT:
			hit(animator)
		States.DEAD:
			dead(animator)

func idle(animator: AnimationPlayer):
	animator.play("Idle")
	
func running(animator: AnimationPlayer):
	animator.play("Run")
	
func attacking(animator: AnimationPlayer):
	animator.play("Attack_1")
	await animator.animation_finished
	_set_state(States.IDLE, animator)
	
func hit(animator: AnimationPlayer):
	animator.play("Idle")
	
func dead(animator: AnimationPlayer):
	animator.play("Idle")
