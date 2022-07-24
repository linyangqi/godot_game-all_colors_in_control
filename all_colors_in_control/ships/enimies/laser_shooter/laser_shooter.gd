extends "res://ships/enimies/enemy_ship.gd"
const laser = preload("res://ships/enimies/laser_shooter/laser/laser.tscn")

func _on_ShootCooldown_timeout():
	var new_laser = laser.instance()
	new_laser.position = position + direction.rotated(rotation) * 90
	new_laser.rotation = rotation
	get_parent().add_child(new_laser)
