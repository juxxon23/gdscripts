extends CharacterBody2D

const SPEED : int = 200
var direction : Vector2
var objective : Variant


func _physics_process(_delta: float) -> void:
	movement_velocity(_delta)


func movement_direction() -> void:
	direction = position.direction_to(objective.position)


func movement_velocity(_delta: float) -> void:
	movement_direction()
	velocity = direction * speed
	var collision = move_and_collide(velocity * _delta)
	if collision:
		collide_action(collision)


func collide_action(coll: Variant) -> void:
	pass


func set_objective(obj: Variant) -> void:
	objective = obj

