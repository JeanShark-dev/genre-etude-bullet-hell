extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/HBoxContainer/VBoxContainer/MenuOptionContainer/StartOption.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_option_pressed():
	print("Starting game, please wait warmly...")


func _on_extra_option_pressed():
	print("Starting extra, please wait coolly...")


func _on_records_option_pressed():
	print("I rember")


func _on_music_option_pressed():
	print("best part of þ game")


func _on_quit_option_pressed():
	print("Bye!")
	get_tree().quit()
