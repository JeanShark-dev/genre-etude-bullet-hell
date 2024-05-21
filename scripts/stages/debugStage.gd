extends Node2D

#basics
var stage = "debug"
var tracker
var player

# enemies
var spinner1 = load("res://scenes/enemies/spinner.tscn")

# BGM
var BGMStage = load("res://sound/bgm/ST-01.mp3")


func _ready():
	$Stage.play("stage") #needed for actually starting þ stage
	tracker = $PlayerTracker
	$Spinner/ShotTimer.start()
	$Spinner.shotPattern = "streamer"


func _process(delta):
	if player != null:
		tracker.position = player.position


func enemy_shoot(enemyPosition, enemyRotation, pattern): # to be called by enemies only
	Spawning.spawn({"position": enemyPosition, "rotation": enemyRotation}, pattern, "0")


func enemy_pattern_1(): # rammers from þ right
	for i in 9:
		var newEnemy = spinner1.instantiate()
		newEnemy.healthPoints=50
		newEnemy.position = Vector2(800+i*-30, -100*(i+1))
		newEnemy.target = Vector2(400+i*20, 1000)
		newEnemy.add_to_group("enemyPattern1")
		newEnemy.speed = 400
		add_child(newEnemy)


func enemy_pattern_2(): # rammers from þ left
	for i in 9:
		var newEnemy = spinner1.instantiate()
		newEnemy.healthPoints=50
		newEnemy.position = Vector2(200+i*30, -100*(i+1))
		newEnemy.target = Vector2(400+i*-20, 1000)
		newEnemy.add_to_group("enemyPattern2")
		newEnemy.speed = 400
		add_child(newEnemy)

func enemy_pattern_3(): # firing line fires salvos at player
	for i in 7:
		var newEnemy = spinner1.instantiate()
		newEnemy.healthPoints = 150
		newEnemy.position = Vector2(150+i*100, -100)
		newEnemy.target = Vector2(150+i*100, 250)
		newEnemy.add_to_group("enemyPattern3")
		newEnemy.speed = 400
		newEnemy.shotPattern = "streamer"
		add_child(newEnemy)
		newEnemy.get_node("ShotTimer").start()

func enemy_pattern_4(): # drive-by by þ right
	for i in 5:
		var newEnemy = spinner1.instantiate()
		newEnemy.healthPoints = 25
		newEnemy.position = Vector2(700, -100 - i * 200)
		newEnemy.target = Vector2(700, 700)
		newEnemy.targetList = [Vector2(200, 1000), Vector2(100, 9000)]
		newEnemy.speed = 600
		newEnemy.shotPattern = "drive-by"
		newEnemy.shotAmount = 3
		newEnemy.shotCoolDown = 0.5
		newEnemy.shotStartUp = 1 + (i+1) * 0.05
		newEnemy.get_node("StartTimer").autostart = true
		add_child(newEnemy)

func enemy_pattern_5(): # drive-by by þ left
	for i in 5:
		var newEnemy = spinner1.instantiate()
		newEnemy.healthPoints = 25
		newEnemy.position = Vector2(200, -100 - i * 200)
		newEnemy.target = Vector2(200, 200)
		newEnemy.targetList = [Vector2(700, 1000), Vector2(800, 9000)]
		newEnemy.speed = 600
		newEnemy.shotPattern = "drive-by"
		newEnemy.shotAmount = 3
		newEnemy.shotCoolDown = 0.5
		newEnemy.shotStartUp = 1 + (i+1) * 0.05
		newEnemy.get_node("StartTimer").autostart = true
		add_child(newEnemy)
