extends Control


func _ready(): # make sure ye can use arrow keys for navigation by focusing first button
	$MarginContainer/HBoxContainer/VBoxContainer/MenuOptionContainer/StartOption.grab_focus()


func _on_start_option_pressed():
	print("Starting game, please wait warmly...")
	get_parent().start_game("default", "default")


func _on_extra_option_pressed():
	print("Starting extra, please wait coolly...")
	get_parent().start_game("default", "extra")

func _on_records_option_pressed():
	print("I rember")


func _on_music_option_pressed():
	print("best part of þ game")


func _on_quit_option_pressed():
	print("Bye!")
	get_tree().quit()
