extends Node2D

#basics
var stage = "debug"
var stageSpeed = 500

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
	for i in $EnemyContainer/Path2D.get_children():
		if i.get_child_count() == 0:
			i.queue_free()


func enemy_shoot(enemyPosition, enemyRotation, pattern): # to be called by enemies only
	Spawning.spawn({"position": enemyPosition, "rotation": enemyRotation}, pattern, "0")


func _on_enemy_spawner_area_entered(area):
	if area.has_method("spawn_self"):
		var newPathFollow
		newPathFollow = PathFollow2D.new()
		$EnemyContainer.get_node(area.movePattern).add_child(newPathFollow)
		#area.reparent(newPathFollow)
		$EnemyContainer.remove_child(area)
		newPathFollow.add_child(area)
		newPathFollow.rotates = false
		area.isReady = true
		area.spawn_self()
