extends Node


var mainMenu = load("res://scenes/main_menu.tscn")


func _ready():
	load_main_menu()


func _process(_delta): # only to be used for debugging
	#print(get_tree().paused)
	pass


func load_main_menu():
	var newMainMenu = mainMenu.instantiate()
	add_child(newMainMenu)
