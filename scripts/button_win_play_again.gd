extends Button


func _ready():
	pass


func _on_button_you_win_play_again_pressed():
	get_tree().change_scene("res://screens/MenuScreen.tscn")
