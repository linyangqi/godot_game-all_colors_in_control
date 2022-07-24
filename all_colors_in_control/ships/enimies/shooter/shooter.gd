extends "res://ships/enimies/enemy_ship.gd"
const bullet = preload("res://ships/enimies/shooter/bullet/bullet.tscn")

func _on_ShootCooldown_timeout():
	var new_bullet = bullet.instance()
	new_bullet.position = position + direction.rotated(rotation) * 60
	new_bullet.rotation = rotation
	get_parent().add_child(new_bullet)
