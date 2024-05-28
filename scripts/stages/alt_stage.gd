extends Node2D

#basics
var stage = "debug"
var stageSpeed = 100
var tracker
var player
@onready var spawner = $EnemySpawner

# enemies
var spinner1 = load("res://scenes/enemies/spinner.tscn")

# BGM
var BGMStage = load("res://sound/bgm/ST-01.mp3")


func _ready():
	tracker = $PlayerTracker


func _process(delta):
	if player != null:
		tracker.position = player.position
	spawner.position += Vector2(0,-1) * stageSpeed * delta


func enemy_shoot(enemyPosition, enemyRotation, pattern): # to be called by enemies only
	Spawning.spawn({"position": enemyPosition, "rotation": enemyRotation}, pattern, "0")


func _on_enemy_spawner_area_entered(area):
	if area.has_method("spawn_self"):
		print("Enemy detected!")
