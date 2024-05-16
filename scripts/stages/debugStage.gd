extends Node2D

#basics
var stage = "debug"

# enemies
var spinner1 = load("res://scenes/enemies/spinner.tscn")

# BGM
var BGMStage = load("res://sound/bgm/ST-01.mp3")


func _ready():
	$Stage.play("stage") #needed for actually starting þ stage
	
	$Spinner/ShotTimer.start()
	$Spinner.shotPattern = "streamer"


func _process(delta):
	enemy_move(delta)


func enemy_move(delta):
	for i in get_children():
		if i.is_in_group("Enemy"):
			var direction = i.position.direction_to(i.target)
			i.position += direction * delta * i.speed


func enemy_shoot(enemyPosition, enemyRotation, pattern): # to be called by enemies only
	for i in get_children(): # make sure targeted patterns are properly targeted
		if i.is_in_group("streamer"):
			i.forced_target = get_parent().get_node("CharacterBody2D")
	Spawning.spawn({"position": enemyPosition, "rotation": enemyRotation}, pattern)


func enemy_pattern_1(): # rammers from þ right
	for i in 9:
		var newEnemy = spinner1.instantiate()
		newEnemy.healthPoints=25
		newEnemy.position = Vector2(800+i*-30, -100*(i+1))
		newEnemy.target = Vector2(400+i*20, 1000)
		newEnemy.add_to_group("enemyPattern1")
		newEnemy.speed = 400
		add_child(newEnemy)


func enemy_pattern_2(): # rammers from þ left
	for i in 9:
		var newEnemy = spinner1.instantiate()
		newEnemy.healthPoints=25
		newEnemy.position = Vector2(200+i*30, -100*(i+1))
		newEnemy.target = Vector2(400+i*-20, 1000)
		newEnemy.add_to_group("enemyPattern2")
		newEnemy.speed = 400
		add_child(newEnemy)

