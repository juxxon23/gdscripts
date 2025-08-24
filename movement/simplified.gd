extends CharacterBody2D

const SPEED : int = 400 # Rapidez (pixels/sec)
var direction : Vector2


func _physics_process(_delta: float) -> void:
	movement_velocity()


func _input(_event: InputEvent) -> void:
	movement_direction()


func movement_direction() -> void:
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")


func movement_velocity() -> void:
	if direction:
		velocity = direction * speed	
	else:
		velocity = Vector2.ZERO

	move_and_slide() # Movement with collisions

