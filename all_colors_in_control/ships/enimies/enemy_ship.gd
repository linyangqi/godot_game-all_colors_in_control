extends "res://ships/ship.gd"

signal enemy_die
enum ShipType{Shooter = 0, Knife = 1, Laser = 2, Landminer = 3}
enum {Shooter = 0, Knife = 1, Laser = 2, Landminer = 3}
export (ShipType) var ship_type

func die():
	emit_signal("die")
	emit_signal("enemy_die",ship_type)
	queue_free()
