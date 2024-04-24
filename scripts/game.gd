extends Node2D


var playerSpawnTarget = Vector2(420, 750)
var playerChar = load("res://scenes/character.tscn")
var playerType
var startingStage


func _ready():
	spawn_player()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_player():
	var newPlayer = playerChar.instantiate()
	newPlayer.position = playerSpawnTarget
	$World.add_child(newPlayer)
