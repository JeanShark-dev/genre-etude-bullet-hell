extends CharacterBody2D


var speed = 100


func _physics_process(delta):
	var move_speed = speed
	if Input.is_action_pressed("gp_focus"):
		move_speed = speed/2
	
	var direction = Vector2(Input.get_axis("gp_left", "gp_right"), Input.get_axis("gp_up", "gp_down"))
	
	if direction:
		velocity = direction * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
		velocity.y = move_toward(velocity.y, 0, move_speed)

	move_and_slide()
