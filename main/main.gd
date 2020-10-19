extends Node2D

func _init():
	randomize()

func _ready():
	get_tree().change_scene("res://ui/mainmenu/mainmenu.tscn")
