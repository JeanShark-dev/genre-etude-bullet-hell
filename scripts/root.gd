extends Node


var mainMenu = load("res://scenes/main_menu.tscn")
var gameMenu = load("res://scenes/game.tscn")
var playerCharacter = load("res://scenes/character.tscn")

func _ready():
	load_main_menu()


func load_main_menu():
	var newMainMenu = mainMenu.instantiate()
	add_child(newMainMenu)


func start_game(player, mode): 
	var newGame = gameMenu.instantiate()
	newGame.playerType = player
	newGame.gameMode = mode	# main or extra
	get_parent().add_child(newGame)
	queue_free()
