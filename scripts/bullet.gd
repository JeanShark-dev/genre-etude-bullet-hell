extends Sprite2D


var bulletSprite 
var hitRadius = 10

func _ready():
	texture.set(bulletSprite, 0)
	add_to_group("Bullet")
