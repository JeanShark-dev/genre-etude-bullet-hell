extends Node2D


var playerSpawnTarget = Vector2(420, 750)
var playerChar = load("res://scenes/character.tscn")

func _ready():
	spawnPlayer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnPlayer():
	var newPlayer = playerChar.instantiate()
	newPlayer.position = playerSpawnTarget
	$World.add_child(newPlayer)
