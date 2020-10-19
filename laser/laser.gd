extends Area2D

var parent
var player
var angle

var alive = true

export (int) var speed = 5

onready var screen_size = get_viewport_rect().size

func init():
	parent = get_parent()
	player = get_node("../Player")
	
	angle = player.angle
	# Need to add 90 to make sure the angle
	# matches up with the unit circle
	rotation_degrees = angle + 90
	position.x = player.position.x
	position.y = player.position.y
	
func _process(_delta):
	if alive:
		position.x += (speed * cos(deg2rad(angle)))
		position.y += (speed * sin(deg2rad(angle)))
		check_bounds()

func check_bounds():
	if global_position.x < 0:
		queue_free()
	elif global_position.x > screen_size.x:
		queue_free()
	else:
		pass
	
	if global_position.y < 0:
		queue_free()
	elif global_position.y > screen_size.y:
		queue_free()
	else:
		pass

func _on_Laser_body_entered(body):
	$Sprite.set_visible(false)
	$CollisionShape2D.disabled = true
	alive = false
	$Explosion.set_emitting(true)
	$ExplosionTimer.start()

func _on_ExplosionTimer_timeout():
	queue_free()
