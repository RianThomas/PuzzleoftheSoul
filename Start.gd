extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	crash()
	$Label.hide()

signal nombre(n)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Sprite1/Sprite2.position.x < 8000:
		$Sprite1/Sprite2.position.x += 0.1
		$Sprite1/Sprite3.position.x += 0.1
		$Sprite1/Sprite4.position.x += 0.1
		$Sprite1/Sprite5.position.x += 0.1
		$Sprite1/Sprite6.position.x += 0.1
		$Sprite1/Sprite7.position.x += 0.1
	await get_tree().create_timer(0.01).timeout 
	if $Sprite0.position.y > 100000:
		$Sprite0.hide()


func _on_button_2_pressed():
	
	while position.y > -2000:
		position.y -= 10 # Replace with function body.
		await get_tree().create_timer(0.01).timeout


func _on_button_3_pressed():
	while position.x < 9200:
		position.x += 10 # Replace with function body.
		await get_tree().create_timer(0.01).timeout
		$Label.show()
		$Button5.show()


func _on_button_4_pressed():
	while position.x > 2400:
		position.x -= 10 # Replace with function body.
		await get_tree().create_timer(0.01).timeout # Replace with function body.


func _on_button_5_pressed():
	while position.x > 5610:
		position.x -= 10 # Replace with function body.
		await get_tree().create_timer(0.01).timeout
		$Label.hide()# Replace with function body.
		$Button5.hide()


func _on_button_6_pressed():
	while position.x < 5610:
		position.x += 10 # Replace with function body.
		await get_tree().create_timer(0.01).timeout # Replace with function body. # Replace with function body.


func _on_button_7_pressed():
	while position.y > -5000:
		position.y -= 10 # Replace with function body.
		await get_tree().create_timer(0.01).timeout # Replace with function body.
	nombre.emit("Adam")
	

func crash():
	await get_tree().create_timer(30).timeout
	while $Sprite0.rotation_degrees > -80:
		$Sprite0.rotation_degrees -= 1
		$Sprite0.position.y += 5
		await get_tree().create_timer(0.01).timeout
	while $Sprite0.position.y > -10000:
		$Sprite0.position.y += 5
		await get_tree().create_timer(0.01).timeout
	#Play the crash sound

func _on_button_8_pressed():
	while position.y > -5000:
		position.y -= 10 # Replace with function body.
		await get_tree().create_timer(0.01).timeout # Replace with function body.
	nombre.emit("Travis")
