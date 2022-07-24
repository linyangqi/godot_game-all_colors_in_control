extends Area2D


func die():
	pass
	

func _on_LifeTime_timeout():
	queue_free()


func _on_Landmine_area_entered(area):
	area.die()
	queue_free()
