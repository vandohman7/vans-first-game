extends Node

@onready var label: Label = %Label

var points = 0

func add_points(num: int):
	points += num 


	
	label.text = "points " + str(points) + "/15"
