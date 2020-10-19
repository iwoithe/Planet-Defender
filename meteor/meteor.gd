extends RigidBody2D

signal meteor_hit

onready var sprite_size = $Sprite.texture.get_size()
onready var screen_size = get_viewport_rect().size

func _ready():
	setup_position()

func _process(_delta):
	check_bounds()

func check_bounds():
	if position.x < (0 - (sprite_size.x / 2)):
		queue_free()
	elif position.x > (screen_size.x + (sprite_size.x / 2)):
		queue_free()
	else:
		pass
	
	if position.y < (0 - (sprite_size.y / 2)):
		queue_free()
	elif position.y > (screen_size.y + (sprite_size.y / 2)):
		queue_free()
	else:
		pass

func setup_position():
	var direction = randi() % 4 + 1
	if direction == 1:
		# Position along the top
		# Position
		position.x = randi() % int(screen_size.x)
		position.y = (0 - int(sprite_size.y / 2))
		# Linear Velocity
		if (randi() % 2 + 1) == 1:
			linear_velocity.x = randi() % 180 + 20
		else:
			linear_velocity.x = -(randi() % 180 + 20)
		
		linear_velocity.y = randi() % 180 + 20
		
	elif direction == 2:
		# Position along the bottom
		# Position
		position.x = randi() % int(screen_size.x)
		position.y = (screen_size.y + int(sprite_size.y / 2))
		# Linear Velocity
		if (randi() % 2 + 1) == 1:
			linear_velocity.x = randi() % 180 + 20
		else:
			linear_velocity.x = -(randi() % 180 + 20)
		
		linear_velocity.y = -(randi() % 180 + 20)
	elif direction == 3:
		# Position along the left
		# Position
		position.x = (0 - int(sprite_size.x / 2))
		position.y = randi() % int(screen_size.y)
		# Linear Velocity
		if (randi() % 2 + 1) == 1:
			linear_velocity.y = randi() % 180 + 20
		else:
			linear_velocity.y = -(randi() % 180 + 20)
		
		linear_velocity.x = randi() % 180 + 20
	elif direction == 4:
		# Position along the right
		# Position
		position.x = (screen_size.x + int(sprite_size.x / 2))
		position.y = randi() % 600
		# Linear Velocity
		if (randi() % 2 + 1) == 1:
			linear_velocity.y = randi() % 180 + 20
		else:
			linear_velocity.y = -(randi() % 180 + 20)
		
		linear_velocity.x = -(randi() % 180 + 20)
	else:
		pass

func _on_Area2D_area_entered(area):
	if area.is_in_group("lasers"):
		emit_signal("meteor_hit")
		queue_free()
