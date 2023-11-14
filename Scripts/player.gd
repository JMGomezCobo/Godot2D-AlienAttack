extends CharacterBody2D

@export var movementSpeed = 300
@export var projectileOffset = 250

var rocket_scene

func _ready():
	rocket_scene = preload("res://Scenes/rocket.tscn")

func _process(delta):
	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	
	move()
	
	move_and_slide()

func move():
	
	velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("move_up"):
		velocity.y = -movementSpeed
	
	if Input.is_action_pressed("move_down"):
		velocity.y = movementSpeed
	
	if Input.is_action_pressed("move_left"):
		velocity.x = -movementSpeed
	
	if Input.is_action_pressed("move_right"):
		velocity.x = movementSpeed

func set_limits():
	var screen_size = get_viewport_rect().size
	
	global_position = global_position.clamp(Vector2(0, 0), screen_size)

func shoot():
	
	var rocket_instance = rocket_scene.instantiate()
	
	add_child(rocket_instance)
	rocket_instance.global_position.x += projectileOffset
