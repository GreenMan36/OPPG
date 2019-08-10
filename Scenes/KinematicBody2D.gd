extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 25
const MOVEMENT_SPEED = 300
const JUMP_HEIGHT = 650

# warning-ignore:unused_class_variable
var debug = false
var motion = Vector2(0, 0)

func _ready():
	pass

# warning-ignore:unused_argument
func _physics_process(delta):
	motion.y += GRAVITY #this is the gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x = MOVEMENT_SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -MOVEMENT_SPEED
	
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_HEIGHT
	motion = move_and_slide(motion, UP) #updates movement
	