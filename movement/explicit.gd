extends CharacterBody2D

const SPEED : int = 400 # Rapidez (pixels/sec)
var direction : Vector2


func _physics_process(_delta: float) -> void:
	movement_velocity(_delta)


func _input(_event: InputEvent) -> void:
	movement_direction()


func movement_direction() -> void:
	direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	#direction.normalized()


func movement_velocity(_delta: float) -> void:
	if direction:
		velocity = direction * speed	
	else:
		velocity = direction

	#position += velocity * _delta # Movement without collisions
	move_and_slide() # Movement with collisions

