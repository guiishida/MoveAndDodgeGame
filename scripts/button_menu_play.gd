extends Button


func _ready():
	pass


func _on_button_menu_play_pressed():
	get_tree().change_scene("res://screens/FaseSelection.tscn")
