extends Node

var score := 0
var ship_counts = [0,0,0,0]


func update_ship_count():
	$UI.update_ship_count(ship_counts)
	$MusicDJ.update_music(ship_counts)


func _on_ship_enemy_die(ship_type):
	if $Player:
		score += 1
		$UI.update_score(score)
	
	ship_counts[ship_type] -=1
	update_ship_count()


func _on_Player_player_die():
	$SummonerArrange.queue_free()

