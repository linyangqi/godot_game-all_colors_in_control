extends Node

const WINDOW_HEIGHT = 1080
const WINDOW_WIDTH = 1920

var summoner := preload("res://assistants/summoner/summoner.tscn")
onready var timer := $SummonTimer


func _on_SummonTimer_timeout():
	var new_summoner = summoner.instance()
	new_summoner.position.x = randi() % WINDOW_WIDTH
	new_summoner.position.y = randi() % WINDOW_HEIGHT
	new_summoner.rotation_degrees = randi() % 360
	get_parent().add_child(new_summoner)


func _on_SpeedUp_timeout():
	if timer.wait_time > 0.05:
		timer.wait_time *= 0.9


func _on_Accelerate_button_down():
	if timer.wait_time > 0.2:
		timer.wait_time *= 0.7
