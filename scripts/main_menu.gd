extends Control


var gameMenu = load("res://scenes/game.tscn")
var playerCharacter = load("res://scenes/character.tscn")


func _ready(): # make sure ye can use arrow keys for navigation by focusing first button
	$MarginContainer/HBoxContainer/VBoxContainer/MenuOptionContainer/StartOption.grab_focus()


func start_game(player, mode): #
	var newGame = gameMenu.instantiate()
	newGame.playerType = player
	newGame.startingStage = mode
	get_parent().add_child(newGame)
	queue_free()


func _on_start_option_pressed():
	print("Starting game, please wait warmly...")
	start_game("default", "default")


func _on_extra_option_pressed():
	print("Starting extra, please wait coolly...")


func _on_records_option_pressed():
	print("I rember")


func _on_music_option_pressed():
	print("best part of þ game")


func _on_quit_option_pressed():
	print("Bye!")
	get_tree().quit()
