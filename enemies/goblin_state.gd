extends Node

enum States {
	IDLE,
	RUN,
	ATTACK,
}

func _set_state(state: States, animator: AnimationPlayer):
	match state:
		States.IDLE:
			idle(animator)
		States.RUN:
			run(animator)
		States.ATTACK:
			attack(animator)
		
	
func idle(animator: AnimationPlayer):
	animator.play("Idle")
	
func run(animator: AnimationPlayer):
	animator.play("Run")
	
func attack(animator: AnimationPlayer):
	animator.play("Carry")
	
