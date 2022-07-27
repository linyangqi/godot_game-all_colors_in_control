extends Node

const EVOLVE_NUMBER = 3
const VOLUME = [-80, -20, -10] #0,1,2 而3就已经质变，保持在-10了

enum ShipType{Shooter = 0, Knife = 1, Laser = 2, Landminer = 3}
enum {Shooter = 0, Knife = 1, Laser = 2, Landminer = 3}

onready var music_list := [
	[$"Shooter/1",$"Shooter/2"],
	[$"Knife/1",$"Knife/2"],
	[$"Laser/1",$"Laser/2"],
	[$"Landminer/1",$"Landminer/2"],
	]

func update_volume(ship_type:int, ship_count:int):
	var music_1 = music_list[ship_type][0]
	var music_2 = music_list[ship_type][1]
	
	if ship_count < 3: # 0 1 2
		music_1.volume_db = VOLUME[ship_count]
		music_2.volume_db = VOLUME[0]
	else:
		music_1.volume_db = VOLUME[0]
		music_2.volume_db = VOLUME[2]
		


func update_music(ship_counts:Array):
	for i in range(ship_counts.size()):
		update_volume(i,ship_counts[i])
		
	
