extends Area2D


@export var healthPoints: int = 100
@export var target: Vector2
@export var speed: int
@export var shotPattern: String
@export var shotAmount = 0
@export var shotCoolDown = 1.0
@export var shotStartUp = 1.0
@export var lifeTime: int
@export var movePattern: String
@export var pathOffset = Vector2(0,0)
var isReady = false
var worldNode
var pathNode


func _ready():
	worldNode = get_parent().get_parent()
	$Timer.wait_time = lifeTime


func _physics_process(delta):
	if isReady:
		move(delta)


func take_damage(damage):
	healthPoints -= damage
	if healthPoints <= 0:
		queue_free()


func spawn_self():
	if lifeTime != 0:
		$Timer.start()
	if shotPattern != "":
		$StartTimer.start(shotStartUp)
	add_to_group("Enemy")
	position = pathOffset
	pathNode = get_parent()


func move(delta):
	pathNode.progress += speed * delta


func _on_timer_timeout():
	queue_free()


func _on_shot_timer_timeout():
	shotAmount -= 1
	worldNode.enemy_shoot(self, shotPattern)
	if shotAmount == 0:
		$ShotTimer.stop()


func _on_start_timer_timeout():
	$ShotTimer.wait_time = shotCoolDown
	$ShotTimer.start()
