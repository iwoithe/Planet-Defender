extends Position2D


func _ready():
	position.x = get_viewport_rect().size.x / 2
	position.y = get_viewport_rect().size.y / 2
