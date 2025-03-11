extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").animation = "idle_down"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if (Input.is_action_pressed("down")):
		get_node("AnimatedSprite2D").animation = "walking_down"
		$AnimatedSprite2D.play()
		position.y += 10

	elif (Input.is_action_pressed("up")):
		get_node("AnimatedSprite2D").animation = "walking_up"
		$AnimatedSprite2D.play()
		position.y -= 10

	elif (Input.is_action_pressed("right")):
		get_node("AnimatedSprite2D").animation = "walking_right"
		$AnimatedSprite2D.play()
		position.x += 10

	elif (Input.is_action_pressed("left")):
		get_node("AnimatedSprite2D").animation = "walking_left"
		$AnimatedSprite2D.play()
		position.x -= 10

	elif (Input.is_action_just_released("down")):
		get_node("AnimatedSprite2D").animation = "idle_down"
	elif (Input.is_action_just_released("up")):
		get_node("AnimatedSprite2D").animation = "idle_up"
	elif (Input.is_action_just_released("right")):
		get_node("AnimatedSprite2D").animation = "idle_right"
	elif (Input.is_action_just_released("left")):
		get_node("AnimatedSprite2D").animation = "idle_left"
	
