extends Button


func _ready():
	pass


func _on_button_gameover_playagain_pressed():
	get_tree().change_scene("res://screens/MenuScreen.tscn")
