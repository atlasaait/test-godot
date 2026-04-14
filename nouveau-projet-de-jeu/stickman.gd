extends CharacterBody2D

@export var run_speed : float = 500.0 
@export var gravity : float = 900.0 

var gravity_dir : int = 1

func flip_gravity() -> void:
	gravity_dir *= -1
	velocity.y = 0
	scale.y *= -1

func _physics_process(delta: float) -> void:
	
	up_direction = Vector2.UP * -gravity_dir
	
	velocity.x = run_speed
	velocity.y += gravity * gravity_dir * delta
	

	if Input.is_action_just_pressed("espace") and (is_on_floor() or is_on_ceiling()):
		flip_gravity()
	
	move_and_slide()
