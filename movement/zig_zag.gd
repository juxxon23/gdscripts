extends CharacterBody2D

const SPEED : int = 200
var direction : Vector2
var objective : Variant
var zigzag_amplitude : float = 400.0
var zigzag_frequency : float = 5.0 # Oscilacion
var zigzag_direction : Vector2


func _physics_process(_delta: float) -> void:
	movement_velocity(_delta)


func movement_direction() -> void:
	# Direccion hacia la presa
	direction = position.direction_to(objective.position)
	# Perpendicular para el zigzag
	var perpendicular = Vector2(-direction.y, direction.x) 
	# Oscilacion lateral
	var offset = perpendicular * sin(time_passed * zigzag_frequency) * zigzag_amplitude 
	# Direccion final con zigzag
	zigzag_direction = (direction + offset.normalized()).normalized() 


func movement_velocity(_delta: float) -> void:
	movement_direction()
	velocity = zigzag_direction * speed
	var collision = move_and_collide(velocity * _delta)
	if collision:
		collide_action(collision)


func collide_action(coll: Variant) -> void:
	pass


func set_objective(obj: Variant) -> void:
	objective = obj

