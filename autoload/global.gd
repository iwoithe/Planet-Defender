extends Node2D

var score = 0

func reset_score():
	score = 0

func add_score(amount: int=1):
	score += amount
