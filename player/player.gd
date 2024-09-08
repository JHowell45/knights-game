class_name Player extends CharacterBody2D

@export var speed: int
@export var attack: int

@onready var animator: AnimationPlayer = %AnimationPlayer
@onready var sprite: Sprite2D = %Sprite2D
@onready var attack_timer: Timer = %Timer
@onready var environment_collision: CollisionShape2D = $EnvironmentCollision
@onready var hurt_box: Area2D = %HurtBox

@onready var followers: Array = []
	

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") * speed * delta
	move_and_slide()

func _on_minion_following(rid: RID) -> void:
	followers.append(rid)
