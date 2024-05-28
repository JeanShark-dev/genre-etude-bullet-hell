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
	tracker = $PlayerTracker


func _process(delta):
	if player != null:
		tracker.position = player.position


func enemy_shoot(enemyPosition, enemyRotation, pattern): # to be called by enemies only
	Spawning.spawn({"position": enemyPosition, "rotation": enemyRotation}, pattern, "0")
