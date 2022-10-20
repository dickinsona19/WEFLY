extends RigidBody2D


var jumpPositon = Vector2(0, -3)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation_degrees = 0
	$jumpCollision.rotation_degrees = 0
	if Input.is_action_pressed("move_left"):
		apply_central_impulse(Vector2(-15,0))
	if Input.is_action_pressed("move_right"):
		apply_central_impulse(Vector2(15,0))
		
	if linear_velocity.x > 250:
		linear_velocity.x = 250
	if linear_velocity.x < -250:
		linear_velocity.x = -250


func _on_Player_body_entered(body):
	apply_central_impulse(Vector2(0,-550))
	$AnimatedSprite.play("jump")
	$jumpTimer.start()


func _on_jumpTimer_timeout():
	$AnimatedSprite.play("idle")

func _integrate_forces(state):
	rotation_degrees = 0
	$jumpCollision.rotation_degrees = 0
