extends Node2D

#basics
var stage = "debug"

# enemies
var spinner1 = load("res://scenes/enemies/spinner.tscn")


func _ready():
	$AnimationPlayer.play("stage") #needed for actually starting þ stage


func _process(delta):
	pass


func test_funtion(testVariable):
	print(testVariable)
