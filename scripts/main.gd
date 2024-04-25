extends Node


var mainMenu = load("res://scenes/main_menu.tscn")


func _ready():
	load_main_menu()


func load_main_menu():
	var newMainMenu = mainMenu.instantiate()
	add_child(newMainMenu)
