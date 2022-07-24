extends Area2D

signal die

const WINDOW_HEIGHT = 1080
const WINDOW_WIDTH = 1920
#onready var WINDOW_HEIGHT = get_parent().rect_size.y
#onready var WINDOW_WIDTH = get_parent().rect_size.x

export var speed:float = 5
export var rotate_speed:float = 0.1
var direction = Vector2.UP

func _physics_process(delta):
	#循环世界，出界则在另一头
	if position.y > WINDOW_HEIGHT:
		position.y = position.y - WINDOW_HEIGHT
	if position.y < 0:
		position.y = position.y + WINDOW_HEIGHT
	if position.x > WINDOW_WIDTH:
		position.x = position.x - WINDOW_WIDTH
	if position.x < 0:
		position.x = position.x + WINDOW_WIDTH
		
	#运动控制
	if Input.is_action_pressed("turn_left"):
		rotation -= rotate_speed
	if Input.is_action_pressed("turn_right"):
		rotation += rotate_speed
		
	
	position += direction.rotated(rotation) * speed
	
func die():
	emit_signal("die")
	queue_free()
	
	
