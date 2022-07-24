extends Node2D

enum ShipType{Shooter = 0, Knife = 1, Laser = 2, Landminer = 3}
enum {Shooter = 0, Knife = 1, Laser = 2, Landminer = 3}

const shooter_ship = preload("res://ships/enimies/shooter/shooter.tscn")
const knife_ship = preload("res://ships/enimies/knife/knife.tscn")
const laser_ship = preload("res://ships/enimies/laser_shooter/laser_shooter.tscn")
const landminer_ship = preload("res://ships/enimies/landminer/landminer.tscn")

export (ShipType) var ship_type
var ship
#var ship_color:Color

#var ship_dict = {
#	"Shooter":
#		{"color":"66ccff"}
#}

func get_ship():
	match ship_type:
		Shooter:
			ship = shooter_ship.instance()
		Knife:
			ship = knife_ship.instance()
		Laser:
			ship = laser_ship.instance()
		Landminer:
			ship = landminer_ship.instance()
	
	


func _ready():
	#随机器
	ship_type = randi() % ShipType.size()
	get_ship()
	modulate = ship.modulate


func summon_ship():
	ship.transform = transform
	ship.connect("enemy_die", get_parent(), "_on_ship_enemy_die")
	get_parent().add_child(ship)
	
	get_parent().ship_counts[ship_type] +=1
	get_parent().update_ship_count()


func _on_Timer_timeout():
	summon_ship()
	queue_free()
