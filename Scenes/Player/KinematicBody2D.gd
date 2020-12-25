extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 25
const MOVEMENT_SPEED = 300
const JUMP_HEIGHT = 650

var motion = Vector2(0, 0)

func _ready():
	pass

func _physics_process(_delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = MOVEMENT_SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -MOVEMENT_SPEED
	
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_HEIGHT
	motion = move_and_slide(motion, UP)
	$AnimatedSprite.play()
