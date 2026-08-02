extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D =  $AnimatedSprite2D
const SPEED = 140.0
const JUMP_VELOCITY = -600.0

#get gravity from project settings to be synced with RigidBody Node
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	#Add Animation
	if velocity.x >1 or velocity.x< -1:
		animated_sprite_2d.animation = "running"
	else:
		animated_sprite_2d.animation = "idle"
		
	#Add gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		animated_sprite_2d.animation = "jump"
		
	#Handle jump
	if Input.is_action_just_pressed("Space") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		print('jump working')
		print(velocity.y)
		
	#Get input direction: -1 , 0 , 1
	var direction = Input.get_axis("Left", "Right")
		
	
	#Apply movement 
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x , 0 , SPEED)
		
	
	move_and_slide()
	
	if direction== -1.0:
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false 
		
		
