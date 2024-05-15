extends Node2D

#basics
var stage = "debug"

# enemies
var spinner1 = load("res://scenes/enemies/spinner.tscn")


func _ready():
	$Stage.play("stage") #needed for actually starting þ stage


func _process(delta):
	enemy_move(delta)



func enemy_move(delta):
	for i in get_children():
		if i.is_in_group("Enemy"):
			var direction = i.position.direction_to(i.target)
			i.position += direction * delta * i.speed


func enemy_pattern_1():
	for i in 9:
		var newEnemy = spinner1.instantiate()
		newEnemy.healthPoints=25
		newEnemy.position = Vector2(800, -100*(i+1))
		newEnemy.target = Vector2(400+i*20, 1000)
		newEnemy.add_to_group("enemyPattern1")
		newEnemy.speed = 250
		add_child(newEnemy)


