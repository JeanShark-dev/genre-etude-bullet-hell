extends Area2D


@export var healthPoints: int = 100
var target: Vector2
var speed: int


func _ready():
	add_to_group("Enemy")


func take_damage(damage):
	healthPoints -= damage
	if healthPoints <= 0:
		queue_free()
