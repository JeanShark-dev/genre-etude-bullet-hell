extends Area2D


var speed = 0
var type = "default"
var moveSpeed

func _ready():
	if type == "default":
		speed = 200
	
	moveSpeed = speed


func _physics_process(delta):
	if Input.is_action_just_pressed("gp_focus"):
		moveSpeed = speed/2
		$Hitbox.show()
	if Input.is_action_just_released("gp_focus"):
		moveSpeed = speed
		$Hitbox.hide()
	
	var direction = Vector2(Input.get_axis("gp_left", "gp_right"), Input.get_axis("gp_up", "gp_down"))
	var velocity = direction * moveSpeed
	position += velocity * delta
	
	position = position.clamp(Vector2(64,32), Vector2(800, 928))
