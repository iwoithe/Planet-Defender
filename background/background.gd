extends Node2D

func _ready():
	$BackgroundTexture.rect_size.x = OS.get_screen_size().x
	$BackgroundTexture.rect_size.y = OS.get_screen_size().y
