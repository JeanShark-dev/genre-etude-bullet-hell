extends Area2D


@export var healthPoints: int = 100
var target: Vector2
var speed: int
var shotPattern
var shotAmount


func _ready():
	add_to_group("Enemy")


func _process(delta):
	move(delta)


func take_damage(damage):
	healthPoints -= damage
	if healthPoints <= 0:
		queue_free()


func move(delta):
	var direction = position.direction_to(target)
	if position.distance_to(target) < delta * speed:
		position = target
	position += direction * delta * speed


func _on_timer_timeout():
	queue_free()


func _on_shot_timer_timeout():
	get_parent().enemy_shoot(position, rotation, shotPattern)
