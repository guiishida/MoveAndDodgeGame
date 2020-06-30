extends KinematicBody

const GRAVITY = -9.8
const SPEED = 6
const ACCELERATION = 3
const DE_ACCELERATION = 5
const ZERO = 0

var velocity = Vector3()
var character
var target
var camera

func _ready():
	#character = get_node(".")
	$Empty.rotate_y(-77)
	character = get_node(".")

func _physics_process(delta):
	
	camera = get_node("Target/Camera").get_global_transform()
	var dir = Vector3()
	
	var is_moving = false
	
	if Input.is_action_pressed("ui_up"):
		dir += - camera.basis[2]
		is_moving = true
	if Input.is_action_pressed("ui_down"):
		dir += camera.basis[2]
		is_moving = true
	if Input.is_action_pressed("ui_left"):
		dir += - camera.basis[0]
		is_moving = true
	if Input.is_action_pressed("ui_right"):
		dir += camera.basis[0]
		is_moving = true
	
	dir.y = 0
	dir = dir.normalized()
	
	velocity.y = delta * GRAVITY
	
	var hv = velocity
	hv.y = 0
	
	var new_pos = dir * SPEED 
	var accel = DE_ACCELERATION
	
	if (dir.dot(hv) > 0):
		accel = ACCELERATION
		
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
	if is_moving	:
		var angle = atan2(hv.x, hv.z)
		var character_rot = character.get_rotation()
		
		character_rot.y = angle
		character.set_rotation(character_rot)
	
#func _physics_process(delta):
#	camera = get_node("Targeto/Camera").get_global_transform()
#	var is_moving = false
	
#	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
#		is_moving = false
#		velocity.x = ZERO
#	elif Input.is_action_pressed("ui_right"):
#		is_moving = true
#		velocity.x = SPEED	
#	elif Input.is_action_pressed("ui_left"):
#		is_moving = true
#		velocity.x = -SPEED
#	else:
#		is_moving = true
#		velocity.x = lerp(velocity.x, 0, 0.1)
#		
#	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
#		is_moving = false
#		velocity.z = ZERO
#	elif Input.is_action_pressed("ui_up"):
#		is_moving = true
#		velocity.z = -SPEED
#	elif Input.is_action_pressed("ui_down"):
#		is_moving = true
#		velocity.z = SPEED
#	else:
#		is_moving = true
#		velocity.z = lerp(velocity.z, 0, 0.1)
#	
#	move_and_slide(velocity)
#	
#	if is_moving:
#		var angles = atan2(velocity.x, velocity.z)
#		var characterRot = character.get_rotation()
#		characterRot.y = angles
#		character.set_rotation(characterRot)
		
		
				

func _on_GhostAnimated_body_entered(body):
	if body.name == 'PacManAnimated':
		get_tree().change_scene("res://screens/GameOver.tscn")


func _on_PinkGhost_body_entered(body):
	if body.name == 'PacManAnimated':
		get_tree().change_scene("res://screens/GameOver.tscn")


func _on_OrangeGhost_body_entered(body):
	if body.name == 'PacManAnimated':
		get_tree().change_scene("res://screens/GameOver.tscn")


func _on_LightBlueGhost_body_entered(body):
	if body.name == 'PacManAnimated':
		get_tree().change_scene("res://screens/GameOver.tscn")
