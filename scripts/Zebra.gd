extends KinematicBody

const TRANSLATION_PACE = 6
const ZERO = 0
const ROTATION_PACE = 6
var velocity = Vector3(0,0,0)

func _ready():
	pass

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = ZERO
	elif Input.is_action_pressed("ui_right"):
		velocity.x = TRANSLATION_PACE
		$MeshInstance.rotate_z(deg2rad(-ROTATION_PACE))
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -TRANSLATION_PACE
		$MeshInstance.rotate_z(deg2rad(ROTATION_PACE))
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = ZERO
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -TRANSLATION_PACE
		$MeshInstance.rotate_x(deg2rad(-ROTATION_PACE))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = TRANSLATION_PACE
		$MeshInstance.rotate_x(deg2rad(ROTATION_PACE))
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
	
	move_and_slide(velocity)

func _on_SpikeBall1_body_entered(body):
	if body.name == 'ZebraCaracter':
		get_tree().change_scene("res://screens/GameOver.tscn")


func _on_SpikeBall2_body_entered(body):
	if body.name == 'ZebraCaracter':
		get_tree().change_scene("res://screens/GameOver.tscn")


func _on_SpikeBall3_body_entered(body):
	if body.name == 'ZebraCaracter':
		get_tree().change_scene("res://screens/GameOver.tscn")


func _on_SpikeBall4_body_entered(body):
	if body.name == 'ZebraCaracter':
		get_tree().change_scene("res://screens/GameOver.tscn")
