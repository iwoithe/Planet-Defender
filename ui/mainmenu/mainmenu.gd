extends Control


func _on_PlayButton_pressed():
	get_tree().change_scene("res://game/game.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
