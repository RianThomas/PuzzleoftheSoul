extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
signal difficulty(diff, posx, posy)
signal trollies(posx, posy)
var event = -1
var mazediff = -1
var doing = false
var origx
var origy
var once = false
var money = 0;
var rep = 0;
var nom
var namer
var onceinvent = false
var onceinvent1 = false
signal randomness(posx, posy)
func _ready():
	event = -2
	position.x = 14000
	position.y = -26600
	$Sprite2D2.hide()
	$Sprite2D3.hide()
	$Sprite2D4.hide()
	$start/Sprite07.connect("nombre", Callable(self, "setName"))
	$start.position.x = position.x - 5675
	$start.position.y = position.y -1700

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if (Input.is_action_pressed("down") and not doing):
		$Sprite2D/AnimatedSprite2D.animation = "walking_down"
		$Sprite2D/AnimatedSprite2D.play() 
		position.y += 20

	elif (Input.is_action_pressed("up") and not doing):
		$Sprite2D/AnimatedSprite2D.animation = "walking_up"
		$Sprite2D/AnimatedSprite2D.play()
		position.y -= 20

	elif (Input.is_action_pressed("right") and not doing):
		$Sprite2D/AnimatedSprite2D.animation = "walking_right"
		$Sprite2D/AnimatedSprite2D.play()
		position.x += 20

	elif (Input.is_action_pressed("left") and not doing):
		$Sprite2D/AnimatedSprite2D.animation = "walking_left"
		$Sprite2D/AnimatedSprite2D.play()
		position.x -= 20

	if (Input.is_action_just_released("down")):
		$Sprite2D/AnimatedSprite2D.animation = "idle_down"
	elif (Input.is_action_just_released("up")):
		$Sprite2D/AnimatedSprite2D.animation = "idle_up"
	elif (Input.is_action_just_released("right")):
		$Sprite2D/AnimatedSprite2D.animation = "idle_right"
	elif (Input.is_action_just_released("left")):
		$Sprite2D/AnimatedSprite2D.animation = "idle_left"
	
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_released("inventory"):
		if not onceinvent:
				doing = true
				$"NewPiskel-1_png(5)/Label".text = nom
				$"NewPiskel-1_png(5)/Label2".text = "Money: " + str(money)
				$"NewPiskel-1_png(5)/Label3".text = "Reputation: " + str(rep)
				$"NewPiskel-1_png(5)".show()
				onceinvent = true
		else:
				$"NewPiskel-1_png(5)".hide()
				onceinvent = false
				doing = false
	
	if mazediff == 0 && position.x < 57450:
		position.x = origx - 400
		position.y = origy + 100
		doing = false
		mazediff = -1
		money += 100
	if mazediff == 2 && position.y > -4150:
		position.x = origx - 200
		position.y = origy + 100
		doing = false
		mazediff = -1
		money += 500
	if mazediff == 1  && position.y > -4150:
		position.x = origx - 200
		position.y = origy + 100
		doing = false
		mazediff = -1
		money += 250
	if $start/Sprite07/Sprite0.position.y > 7500 and not once:
		$start/Sprite07/Sprite0.hide()
		$start/Sprite07/Sprite0.position.y = 0
		once = true
		position.x = 0 + 200
		position.y = 0 + 200
		doing = false
	if $AudioStreamPlayer2D.playing == false:
		$AudioStreamPlayer2D.play()
	move_and_slide()
	
	
 
func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	var orig = $Sprite0/Sprite3.scale.x
	var origpos3 = $Sprite0/Sprite3.position.x
	var origpos4 = $Sprite0/Sprite4.position.x
	var origpos5 = $Sprite0/Sprite5.position.x
	event = 0

	$Sprite0.position.x = position.x - 3000
	$Sprite0.position.y = position.y - 6500
	$Sprite0.show()
	while $Sprite0/Sprite3.texture.get_width() > 0 and $Sprite0/Sprite3.scale.x > 0:
		$Sprite0/Sprite3.scale.x -= 0.1
		$Sprite0/Sprite3.position.x += 21
		await get_tree().create_timer(0.05).timeout
	while $Sprite0/Sprite4.texture.get_width() > 0 and $Sprite0/Sprite4.scale.x > 0:
		$Sprite0/Sprite4.scale.x -= 0.1
		$Sprite0/Sprite4.position.x += 21
		await get_tree().create_timer(0.05).timeout
	while $Sprite0/Sprite5.texture.get_width() > 0 and $Sprite0/Sprite5.scale.x > 0:
		$Sprite0/Sprite5.scale.x -= 0.1
		$Sprite0/Sprite5.position.x += 21
		await get_tree().create_timer(0.05).timeout
	if Input.is_action_pressed("interaction") or Input.is_action_just_pressed("interaction") or Input.is_key_pressed(KEY_I):
		$Sprite0.hide()
		event = 0
		$Sprite2D2.show()
		$Sprite2D3.show()
		$Sprite2D4.show()
	await get_tree().create_timer(5).timeout
	$Sprite0/Sprite3.scale.x = orig
	$Sprite0/Sprite4.scale.x = orig
	$Sprite0/Sprite5.scale.x = orig
	$Sprite0/Sprite3.position.x = origpos3
	$Sprite0/Sprite4.position.x = origpos4
	$Sprite0/Sprite5.position.x = origpos5
	await get_tree().create_timer(1).timeout
	$Sprite0/Label2.text = """Hello """ + nom + """. Welcome to this town! Do you want to try out a new puzzle I made?"""
	while $Sprite0/Sprite3.texture.get_width() > 0 and $Sprite0/Sprite3.scale.x > 0:
		$Sprite0/Sprite3.scale.x -= 0.1
		$Sprite0/Sprite3.position.x += 21
		await get_tree().create_timer(0.05).timeout
	while $Sprite0/Sprite4.texture.get_width() > 0 and $Sprite0/Sprite4.scale.x > 0:
		$Sprite0/Sprite4.scale.x -= 0.1
		$Sprite0/Sprite4.position.x += 21
		await get_tree().create_timer(0.05).timeout
	while $Sprite0/Sprite5.texture.get_width() > 0 and $Sprite0/Sprite5.scale.x > 0:
		$Sprite0/Sprite5.scale.x -= 0.1
		$Sprite0/Sprite5.position.x += 21
		await get_tree().create_timer(0.05).timeout
	await get_tree().create_timer(5).timeout
	$Sprite0.hide()
	event = 0
	$Sprite2D2.show()
	$Sprite2D3.show()
	$Sprite2D4.show()
	
	

func _on_area_2d_2_area_exited(area):
	$Sprite0.hide()
	$Sprite2D2.hide()
	$Sprite2D3.hide()
	$Sprite2D4.hide()# Replace with function body.
	event = -1


func _on_sprite_2d_2_pressed():
	$Sprite2D2.hide()
	$Sprite2D3.hide()
	$Sprite2D4.hide()
	if event == 0:
		origx = position.x
		origy = position.y
		position.x = 55250
		position.y = -11350 
		mazediff = 1
	elif event == 1:
		difficulty.emit(1, position.x, position.y)


func _on_sprite_2d_4_pressed():
	$Sprite2D2.hide()
	$Sprite2D3.hide()
	$Sprite2D4.hide()
	if event == 0:
		origx = position.x
		origy = position.y
		position.x = 64500
		position.y = -11250
		mazediff = 0
	elif event == 1:
		difficulty.emit(0, position.x, position.y)


func _on_sprite_2d_3_pressed():
	$Sprite2D2.hide()
	$Sprite2D3.hide()
	$Sprite2D4.hide()
	if event == 0:
		origx = position.x
		origy = position.y
		position.x = 75000
		position.y = -11500 # Replace with function body.
		mazediff = 2
	elif event == 1:
		difficulty.emit(2, position.x, position.y)


func _on_area_2d_2_area_entered(area):
	#			dialouge <<<<<<<<<<<<<<<<<<<<
	$Sprite2D2.show()
	$Sprite2D3.show()
	$Sprite2D4.show()
	event = 1


func _on_area_2d_3_area_entered(area):
	trollies.emit(position.x, position.y)
	doing = true


func _on_area_2d_3_area_exited(area):
	event = -1


func _on_background_riddle_scores(s, d):
	money += (s + d) * 100 # Replace with function body.
	


func _on_background_trolley_rep_random(r):
	rep += r# Replace with function body.


func _on_timer_timeout():
	if event == -1:
		randomness.emit(position.x, position.y)# Replace with function body.
	$Timer.wait_time = randi() % 101 + 40
	$Timer.start()
	
func setName(n):
	nom = n
	event = -1


func _on_button_pressed():
	doing = not doing # Replace with function body.
