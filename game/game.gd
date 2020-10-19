extends Node2D

onready var meteor_scene = preload("res://meteor/meteor.tscn")

func _ready():
	$HUD.rect_size = get_viewport_rect().size
	Global.reset_score()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func _on_MeteorTimer_timeout():
	var new_meteor = meteor_scene.instance()
	new_meteor.connect("meteor_hit", self, "_on_meteor_hit")
	$Meteors.add_child(new_meteor)

func update_score():
	Global.add_score(1)
	$HUD/HBoxContainer/Score.text = "Score: " + str(Global.score)

func _on_meteor_hit():
	update_score()
