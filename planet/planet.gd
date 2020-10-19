extends Area2D

onready var fade_tween = get_node("FadeTween")

func _on_Planet_body_entered(body):
	get_tree().paused = true
	$EndTimer.start()

func _on_EndTimer_timeout():
	# TODO: Fade the game scene to the main menu and vice versa
	#fade_tween.interpolate_property(get_node("../../../Game"), "modulate", Color(1, 1, 1, 1), Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	#fade_tween.start()
	#yield(fade_tween, "tween_completed")
	
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene("res://ui/mainmenu/mainmenu.tscn")
	
