extends Node2D

#basics
var stage = "debug"

# enemies
var spinner1 = load("res://scenes/enemies/spinner.tscn")

#timers
var spawnTimer1Count = 10


func _on_start_timer_timeout():
	$TimerContainer/SpawnTimer1.start()


func _on_spawn_timer_1_timeout():
	spawnTimer1Count -= 1
	if spawnTimer1Count == 1:
		$TimerContainer/SpawnTimer1.one_shot = true
	
	var newEnemy = spinner1.instantiate()
	newEnemy.position = Vector2(100,100)
	add_child(newEnemy)
