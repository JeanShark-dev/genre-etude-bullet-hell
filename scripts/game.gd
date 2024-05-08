extends Node2D


var playerSpawnTarget = Vector2(420, 750)
var playerChar = load("res://scenes/character.tscn")
var playerType
var startingStage
var isPaused = false


func _ready():
	spawn_player()
	print(get_groups())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("gp_pause"):
		isPaused = !isPaused
		pause()


func pause():
	if isPaused:
		print("Taking a break?")
		get_tree().paused = true
		$World/PauseMenu.show()
		$World/PauseMenu/PauseBG/PauseMenuContainer/PauseMenuOptions/PauseMenuOption.grab_focus()
	if !isPaused:
		print("Let þ game continue!")
		get_tree().paused = false
		$World/PauseMenu.hide()


func spawn_player():
	var newPlayer = playerChar.instantiate()
	newPlayer.position = playerSpawnTarget
	$World.call_deferred("add_child", newPlayer)


func check_bullet_collision(): # for each bullet, check its hitradius for player hitradius
	pass


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
