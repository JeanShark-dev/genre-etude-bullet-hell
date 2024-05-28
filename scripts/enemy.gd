extends Area2D


@export var healthPoints: int = 100
@export var target: Vector2
@export var speed: int
@export var shotPattern: String
@export var shotAmount = 0
@export var shotCoolDown = 1.0
@export var shotStartUp = 1.0
var isReady = false



func _process(delta):
	if isReady:
		move(delta)


func take_damage(damage):
	healthPoints -= damage
	if healthPoints <= 0:
		get_parent().queue_free()


func spawn_self():
	$StartTimer.wait_time = shotStartUp
	add_to_group("Enemy")


func move(delta):
	get_parent().progress += speed * delta


func _on_timer_timeout():
	get_parent().queue_free()


func _on_shot_timer_timeout():
	shotAmount -= 1
	get_parent().enemy_shoot(position, rotation, shotPattern)
	if shotAmount == 0:
		$ShotTimer.stop()


func _on_start_timer_timeout():
	$ShotTimer.wait_time = shotCoolDown
	$ShotTimer.start()
