extends CharacterBody2D

@export var speed = 400 # Rapidez (pixels/sec)

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	# direction 
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity * speed	
	
	move_and_slide()

# Using direction var, normalized and explicit move
func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
		
	if direction.length() > 0:
		velocity = direction.normalized() * speed	
	
	# Movement without collisions
	position += velocity * delta 

