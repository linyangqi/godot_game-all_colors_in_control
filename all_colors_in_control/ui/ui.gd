extends Control

enum ShipType{Shooter = 0, Knife = 1, Laser = 2, Landminer = 3}
enum {Shooter = 0, Knife = 1, Laser = 2, Landminer = 3}

func _ready():
	 $GameOver.visible = false

func update_score(score):
	$Score.text = "Score: "+ str(score)
	$GameOver/Score.text =  "Final Score: \n" + str(score)

func update_kills(kills):
	$Kills.text = "Kills: "+ str(kills)
	$GameOver/Kills.text =  "(Kills: " + str(kills) + ")"


func update_ship_count(ship_count):
	$ShipCount.text = str(ship_count)


func update_summon_speed(speed):
	pass


func _on_Player_player_die():
	$GameOver.visible = true
