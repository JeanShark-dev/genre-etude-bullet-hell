extends CharacterBody2D


var speed = 0
var type = "default"


func _ready():
	if type == "default":
		speed = 200


func _physics_process(_delta):
	var moveSpeed = speed
	$Hitbox.hide()
	if Input.is_action_pressed("gp_focus"):
		moveSpeed = speed/2
		$Hitbox.show()
	
	var direction = Vector2(Input.get_axis("gp_left", "gp_right"), Input.get_axis("gp_up", "gp_down"))
	
	if direction:
		velocity = direction * moveSpeed
	else:
		velocity.x = move_toward(velocity.x, 0, moveSpeed)
		velocity.y = move_toward(velocity.y, 0, moveSpeed)

	move_and_slide()
	position = position.clamp(Vector2(64,32), Vector2(800, 928))
