extends RigidBody2D


var jumpPositon = Vector2(0, -3)
var coins = 0
var maxSpeed = (coins+1) *.05

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
		
	if linear_velocity.x > 250 + (250*maxSpeed):
		linear_velocity.x = 250 + (250*maxSpeed)
	if linear_velocity.x < -250 +(-250*maxSpeed):
		linear_velocity.x = -250 + (-250*maxSpeed)


func _on_Player_body_entered(body):
	applyJump()


func _on_jumpTimer_timeout():
	$AnimatedSprite.play("idle")

func _integrate_forces(state):
	rotation_degrees = 0
	$jumpCollision.rotation_degrees = 0
	
func applyJump():
	apply_central_impulse(Vector2(0,-550 + (-250*maxSpeed)))
	$AnimatedSprite.play("jump")
	$jumpTimer.start()
