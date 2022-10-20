extends KinematicBody2D


var movingLeft =true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if movingLeft == true:
		position.x -= 5
		$AnimatedSprite.flip_h = false
	else:
		position.x += 5
		$AnimatedSprite.flip_h = true
	
	if position.x <= 115:
		movingLeft = false
	if position.x >= 590:
		movingLeft = true


func _on_playerHitBox_body_entered(body):
	if body.name == "Player":
		get_parent().endGame(body)


func _on_EnemyHitBox_body_entered(body):
	if body.name == "Player":
		get_parent().get_node("Player").applyJump()
		$AnimatedSprite.play("dead")
		$Timer.start()


func _on_Timer_timeout():
	queue_free()
