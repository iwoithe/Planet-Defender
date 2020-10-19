extends Area2D

export (float) var angle = -90.0
# `angle_step` is the amount at which the
# `angle` is changed (in each loop). It is
# basically the speed of the player.
export (float) var angle_step = 1.3
export (float) var distance = 200.0


# The way the player moves is based on the
# unit circle. The position is calculated by
# using:
# ((distance * (cos angle), (distance * (sin angle)))
# The origin can be moved by moving the parent
# of the player, so that the player moves with
# the parent. The player's parent is called
# `Origin`. An important thing to remember is
# to remember to work in degrees - not radians

onready var laser_scene = preload("res://laser/laser.tscn")

var can_shoot = true

func _process(_delta):
	if Input.is_action_pressed("move_left"):
		angle -= angle_step
	elif Input.is_action_pressed("move_right"):
		angle += angle_step
	else:
		pass
		
	if Input.is_action_pressed("fire"):
		shoot_laser()
	
	position = calculate_position(angle)
	rotation_degrees = godot_rotation_to_unit_circle(angle)

func shoot_laser():
	if can_shoot:
		can_shoot = false
		var new_laser = laser_scene.instance()
		get_parent().add_child(new_laser)
		new_laser.init()
		$LaserTimer.start()

func calculate_position(ang: float) -> Vector2:
	var pos = Vector2()
	
	pos.x = (distance * cos(deg2rad(ang)))
	pos.y = (distance * sin(deg2rad(ang)))
	
	return pos

func godot_rotation_to_unit_circle(ang: float) -> float:
	ang += 90
	return ang

func _on_LaserTimer_timeout():
	can_shoot = true
