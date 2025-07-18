extends CharacterBody2D

@export var speed = 400 # Rapidez con la que se movera el jugador (pixels/sec)

func _process(delta: float) -> void:
	velocity = Vector2.ZERO 
	# Direccion en la que se desplaza el jugador
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed # fix diagonal acceleration	
		
	position += velocity * delta
