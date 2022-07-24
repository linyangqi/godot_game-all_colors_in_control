extends "res://ships/ship.gd"

signal player_die

func die():
	emit_signal("die")
	emit_signal("player_die")
	queue_free()
