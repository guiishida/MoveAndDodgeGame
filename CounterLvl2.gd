extends Label

var coins = 0;

func _ready():
	text = String(coins)

	
		
func _on_Timer_timeout():
	get_tree().change_scene("res://screens/Win.tscn")


func _on_Ball_ballCollected():
	coins = coins + 1
	_ready()
	if coins == 21:
		$Timer.start()
