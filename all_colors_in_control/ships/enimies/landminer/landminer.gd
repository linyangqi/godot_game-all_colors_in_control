extends "res://ships/enimies/enemy_ship.gd"
const landmine = preload("res://ships/enimies/landminer/landmine/landmine.tscn")

func _on_ShootCooldown_timeout():
	var new_landmine = landmine.instance()
	new_landmine.position = position - direction.rotated(rotation) * 80
	new_landmine.rotation = rotation
	get_parent().add_child(new_landmine)
