extends Area2D


@export var healthPoints: int = 100
var target: Vector2
var speed: int
var shotPattern



func _ready():
	add_to_group("Enemy")


func take_damage(damage):
	healthPoints -= damage
	if healthPoints <= 0:
		queue_free()


func _on_timer_timeout():
	queue_free()


func _on_shot_timer_timeout():
	get_parent().enemy_shoot(position, rotation, shotPattern)
