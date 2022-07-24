extends "res://ships/ship.gd"

func _on_LifeTime_timeout():
	queue_free()


func _on_bullet_area_entered(area):
	area.die()
	queue_free()
