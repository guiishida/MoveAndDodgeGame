extends Area

signal ballCollected

func _ready():
	pass

#func _physics_process(delta):
	#rotate_y(deg2rad(3))

func _on_Ball_body_entered(body):
	if body.name == "ZebraCaracter":
		emit_signal("ballCollected")
		$Timer.start()
		
func _on_Timer_timeout():
	queue_free()
