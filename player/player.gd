class_name Player extends CharacterBody2D

@export var speed: int
@export var attack: int

@onready var animator: AnimationPlayer = %AnimationPlayer
@onready var sprite: Sprite2D = %Sprite2D
@onready var attack_timer: Timer = %Timer
@onready var environment_collision: CollisionShape2D = $EnvironmentCollision
@onready var hurt_box: Area2D = %HurtBox

@onready var followers: Array = []

@onready var fsm: StateMachine = %StateMachine
