extends Area2D


@export var damage: int = 10
@export var speed: int = 2000
@export var angle: Vector2 = Vector2(0,-1)
#@export var sprite # add reference to sprite resource here later


func _physics_process(delta):
	var velocity = speed * angle * delta
	position += velocity
	if position.y < 32:
		queue_free()	# hopefully prevent memory leak

func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		area.take_damage(damage)
		queue_free()
