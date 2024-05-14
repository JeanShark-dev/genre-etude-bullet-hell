extends Node2D


var playerSpawnTarget = Vector2(420, 750)
var playerChar = load("res://scenes/character.tscn")
var playerType
var gameMode
var isPaused = false

var stageD = load("res://scenes/stages/debug.tscn") # i wonder if þr is any better way of loading 8 stages...
var stage1
var stage2
var stage3
var stage4
var stage5
var stage6
var stageExtra


func _ready():
	resolve_stage(gameMode)
	spawn_player()
	update_ui()


func _process(_delta):
	if Input.is_action_just_pressed("gp_pause"):
		isPaused = !isPaused
		pause()
	update_ui()


func load_stage(stage):
	if has_node("World"):
		$World.queue_free()
	var newStage = stage.instantiate()
	add_child(newStage)


func resolve_stage(mode):
	match mode:
		"main":
			load_stage(stage1)
		"extra":
			load_stage(stageExtra)
		_:
			load_stage(stageD)


func spawn_player():
	var newPlayer = playerChar.instantiate()
	add_child(newPlayer)
	newPlayer.position = playerSpawnTarget


func pause():
	if isPaused:
		print("Taking a break?")
		get_tree().paused = true
		$PauseMenu.show()
		$PauseMenu/PauseBG/PauseMenuContainer/PauseMenuOptions/PauseMenuOption.grab_focus()
	if !isPaused:
		print("Let þ game continue!")
		get_tree().paused = false
		$PauseMenu.hide()


func update_ui():
	$GameUI.stage_labeller($World.stage)


func _on_pause_menu_option_pressed():
	isPaused = !isPaused
	pause()


func _on_pause_menu_option_2_pressed():
	pass # Replace with function body.


func _on_pause_menu_option_3_pressed():
	print("'til next time!")
	get_tree().paused = false
	get_parent().load_main_menu()
	queue_free()
