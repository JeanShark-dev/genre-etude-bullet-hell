extends Area2D


@export var healthPoints: int = 100
var target: Vector2
var targetList: Array
var speed: int
var shotPattern
var shotAmount = 0
var shotCoolDown = 1.0
var shotStartUp = 1.0


func _ready():
	$StartTimer.wait_time = shotStartUp
	add_to_group("Enemy")


func _process(delta):
	move(delta)


func take_damage(damage):
	healthPoints -= damage
	if healthPoints <= 0:
		queue_free()


func move(delta):
	var direction = position.direction_to(target)
	if position == target:
		switch_target()
		return
	if position.distance_to(target) < delta * speed:
		position = target
		return
	position += direction * delta * speed


func switch_target():
		if !targetList.is_empty():
			target = targetList.pop_front()



func _on_timer_timeout():
	queue_free()


func _on_shot_timer_timeout():
	shotAmount -= 1
	get_parent().enemy_shoot(position, rotation, shotPattern)
	if shotAmount == 0:
		$ShotTimer.stop()


func _on_start_timer_timeout():
	$ShotTimer.wait_time = shotCoolDown
	$ShotTimer.start()
