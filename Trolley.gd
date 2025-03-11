extends Sprite2D

var situations = ["1 person vs 5 people", "Your Friend vs 2 people", "Your Family vs 20 people", "1000 Coins vs 1 person", "You vs Master Monag"]
var options = [["1 person", "5 people"], ["Your Friend", "2 people"], ["Your Family", "20 people"], ["1000 coins", "1 person"], ["You", "Master Monag"]]
var rep_ans = ["1 person", "Your Friend", "Your Family", "1 person", "Master Monag"]
var ans = []
signal trolleyChoice
signal repRandom(r)
var repScore = 0;
var once = false
var oncef = false
var i = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if i < 5:
		$Label.text = situations[i]
		$Option1.text = options[i][0]
		$Option2.text = options[i][1]
		await trolleyChoice
		if ans[i-1] == rep_ans[i-1] and i-1 != -1 and not once:
			once = true
			repScore += 1
	if not oncef and i == 3:
		repRandom.emit(repScore)
		oncef = true
	if i == 5:
		self.hide()
func _on_option_1_pressed():
	if i < 5: # Replace with function body.
		i += 1
		ans.append($Option1.text)
	trolleyChoice.emit() 
	

 
func _on_option_2_pressed():
	if i < 5: # Replace with function body.
		i += 1
		if i == 4:
			get_tree().quit()
		ans.append($Option2.text)
	trolleyChoice.emit() 


func _on_player_trollies(posx, posy):
	position.x = posx
	position.y = posy # Replace with function body.
