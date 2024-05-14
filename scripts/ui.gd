extends ColorRect


func stage_labeller(stage):
	var label = $MarginContainer/VBoxContainer/LevelLabel
	match stage:
		"debug":
			label.text = "LEVEL0LABEL"
		"1":
			label.text = "LEVEL1LABEL"
		"2":
			label.text = "LEVEL2LABEL"
		"3":
			label.text = "LEVEL3LABEL"
		"4":
			label.text = "LEVEL4LABEL"
		"5":
			label.text = "LEVEL5LABEL"
		"6":
			label.text = "LEVEL6LABEL"
		"extra":
			label.text = "LEVELEXLABEL"
		_:
			label.text = "dev forgot þs stage lol"
