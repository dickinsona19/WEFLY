extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().get_node("Player").position.y ==position.y -700:
		queue_free()
	



func _on_Area2D_body_entered(body):
	if body.get_groups()[0] == "jumpPlatform":
		queue_free()
