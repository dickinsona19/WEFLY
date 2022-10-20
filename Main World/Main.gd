extends Node2D


var maxPlayerHeight
var prePlayerMaxHeight
var gameRunning = true


# Called when the node enters the scene tree for the first time.
func _ready():
	maxPlayerHeight = $Player.position.y
	prePlayerMaxHeight = $Player.position.y
	for x in 10:
		spawnPlatforms()
		spawnCoins()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameRunning:
		if $Player.position.y < maxPlayerHeight:
			maxPlayerHeight = $Player.position.y
		if prePlayerMaxHeight >= maxPlayerHeight +500:
			for x in 10:
				spawnPlatforms()
				spawnCoins()
			spawnEnemies()
			prePlayerMaxHeight = maxPlayerHeight
		$Camera2D.position.y = maxPlayerHeight - 200
		
		$BackGround/BackgroundEmpty.position.y = maxPlayerHeight + 100
		$deathColliders.position.y = maxPlayerHeight + 198
		
		$HUD/CanvasLayer/Label.text = ":" + str($Player.coins)
	

func spawnPlatforms():
	var newPlatform = load("res://Main World/jumpPlatform.tscn")
	var instancedPlatform = newPlatform.instance()
	instancedPlatform.position = Vector2(randi() % 480 + 120, rand_range($Player.position.y - 500 ,$Player.position.y -1000 ))
	add_child(instancedPlatform)

func spawnCoins():
	var newCoin = load("res://Coin/coin.tscn")
	var instancedCoin = newCoin.instance()
	instancedCoin.position = Vector2(randi() % 480 + 120, rand_range($Player.position.y - 500 ,$Player.position.y -1000 ))
	add_child(instancedCoin)

func spawnEnemies():
	var newEnemy = load("res://Enemy/Enemy.tscn")
	var instancedEnemy = newEnemy.instance()
	instancedEnemy.position = Vector2(randi() % 480 + 120, rand_range($Player.position.y - 500 ,$Player.position.y -1000 ))
	add_child(instancedEnemy)


func _on_DeathCollider_body_entered(body):
	endGame(body)


func _on_DeathCollider2_body_entered(body):
	endGame(body)

func endGame(body):
	if body.name == "Player":
		$Player.visible = false
		gameRunning = false
