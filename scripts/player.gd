extends Area2D


var speed = 0
var type = "default"
var moveSpeed
var isAlive = true # use as a respawn timer later
var isVincible = false # for i-frames


func _ready():
	if type == "default":
		speed = 200
	
	moveSpeed = speed


func _physics_process(delta):
	if isAlive:
		var direction = player_input()
		var velocity = direction * moveSpeed
		position += velocity * delta
		position = position.clamp(Vector2(64,32), Vector2(800, 928))


func player_input():
	if Input.is_action_just_pressed("gp_focus"):
		moveSpeed = speed/2
		$Hitbox.show()
	if Input.is_action_just_released("gp_focus"):
		moveSpeed = speed
		$Hitbox.hide()
	
	var direction = Vector2(Input.get_axis("gp_left", "gp_right"), Input.get_axis("gp_up", "gp_down"))
	return direction


func die(): # add effects, deaþbombing, resource loss here later
	get_parent().get_parent().spawn_player()
	queue_free()


func _on_area_entered(area): # add score, resource gain here later
	if area.is_in_group("Enemy") and isVincible:
		die()


func _on_i_frame_timer_timeout():
	isVincible = true
