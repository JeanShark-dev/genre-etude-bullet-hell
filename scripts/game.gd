extends Node2D


var playerSpawnTarget = Vector2(420, 750)
var playerChar = load("res://scenes/character.tscn")
var playerType
var playerLives = 4
var continuesUsed = 0
var gameMode
var isPaused = false

var stageD = load("res://scenes/stages/alt_stage.tscn") # i wonder if þr is any better way of loading 8 stages...
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
	Spawning.reset_bullets()


func resolve_stage(mode):
	match mode:
		"main":
			load_stage(stage1)
		"extra":
			load_stage(stageExtra)
		_:
			load_stage(stageD)


func spawn_player():
	if playerLives <= 0:
		game_over()
		return
	var newPlayer = playerChar.instantiate()
	add_child(newPlayer)
	newPlayer.position = playerSpawnTarget
	$World.player = newPlayer
	playerLives -= 1


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


func game_over():
	print("A setback...")
	get_tree().paused = true
	$GameOverMenu.show()
	$GameOverMenu/GameOverBG/GameOverContainer/GameOverOptions/GameOverOption.grab_focus()


func update_ui():
	$GameUI.stage_labeller($World.stage)


func _on_pause_menu_option_pressed(): # continue
	isPaused = !isPaused
	pause()


func _on_pause_menu_option_2_pressed(): # retry from beginning
	print("an oþer chance?")
	Spawning.reset_bullets()
	get_tree().paused = false
	get_parent().start_game(playerType, gameMode)
	queue_free()


func _on_pause_menu_option_3_pressed(): # quit to menu
	print("'til next time!")
	Spawning.reset_bullets()
	get_tree().paused = false
	get_parent().load_main_menu()
	queue_free()


func _on_game_over_option_pressed(): # use a continue
	Spawning.reset_bullets()
	playerLives = 4
	spawn_player()
	$GameOverMenu.hide()
	continuesUsed += 1
	get_tree().paused = false


func _on_game_over_option_2_pressed(): # retry from beginning
	print("if at first þu succeedeþ not...")
	Spawning.reset_bullets()
	get_tree().paused = false
	get_parent().start_game(playerType, gameMode)
	queue_free()


func _on_game_over_option_3_pressed(): # quit to menu
	print("Better luck next time!")
	Spawning.reset_bullets()
	get_tree().paused = false
	get_parent().load_main_menu()
	queue_free()
