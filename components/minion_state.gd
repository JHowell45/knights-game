extends Node

enum States {
	IDLE,
	RUN,
	CARRY,
	BUILD,
	CHOP
}

func _set_state(state: States, animator: AnimationPlayer):
	match state:
		States.IDLE:
			idle(animator)
		States.RUN:
			run(animator)
		States.CARRY:
			carry(animator)
		States.BUILD:
			build(animator)
		States.CHOP:
			chop(animator)
	
func idle(animator: AnimationPlayer):
	animator.play("Idle")
	
func run(animator: AnimationPlayer):
	animator.play("Run")
	
func carry(animator: AnimationPlayer):
	animator.play("Carry")
	
func build(animator: AnimationPlayer):
	animator.play("Build")
	
func chop(animator: AnimationPlayer):
	animator.play("Chop")
	
