extends Sprite2D

signal choice
signal scores(s, d)
var _delta = 1
var i = 0
var comp = -1
var score = 0;
var easy_riddles = ["What has keys but can't open locks?", "What comes once in a minute, twice in a moment, but never in a thousand years?", "What has a face and two hands but no arms or legs?"]
var easy_riddles_choices = [
	["A) Piano", "B) Map", "C) Phone", "D) Book"],    # Riddle 1 choices
	["A) The letter 'M'", "B) A second", "C) A minute hand", "D) A day"],    # Riddle 2 choices
	["A) A clock", "B) A mirror", "C) A painting", "D) A watch"]    # Riddle 3 choices
]
var easy_ans = ["A) Piano", "A) The letter 'M'", "D) A watch"]
var med_riddles = ["I’m tall when I’m young and short when I’m old. What am I?", "The more you take, the more you leave behind. What am I?", "What can travel around the world while staying in the corner?"]
var medium_riddles_choices = [
	["A) A candle", "B) A tree", "C) A pencil", "D) A mountain"],    # Riddle 1 choices
	["A) Footsteps", "B) Time", "C) Shadows", "D) Water"],    # Riddle 2 choices
	["A) A stamp", "B) A letter", "C) A plane", "D) A coin"]    # Riddle 3 choices
]
var med_ans = ["C) A pencil", "A) Footsteps", "A) A stamp"]

var hard_riddles = ["I speak without a mouth and hear without ears. I have nobody, but I come alive with the wind. What am I?", "I am not alive, but I grow; I don’t have lungs, but I need air; I don’t have a mouth, and yet water kills me. What am I?", "The more you have of me, the less you see. What am I?"]
var hard_riddles_choices = [
	["A) A tree", "B) An echo", "C) A shadow", "D) A cloud"],    # Riddle 1 choices
	["A) Fire", "B) A plant", "C) A shadow", "D) A stone"],    # Riddle 2 choices
	["A) Darkness", "B) Light", "C) Fog", "D) Time"]    # Riddle 3 choices
]
var hard_ans = ["B) An echo", "A) Fire", "A) Darkness"]
var ans = []
var once = false
var oncef = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if comp == 0:
		if i < 3:
			$Label.text = easy_riddles[i]
			$Option1.text = easy_riddles_choices[i][0]
			$Option2.text = easy_riddles_choices[i][1]
			$Option3.text = easy_riddles_choices[i][2]
			$Option4.text = easy_riddles_choices[i][3]
			await choice
			if ans[i-1] == easy_ans[i-1] and i-1 != -1 and not once:
				once = true
				score += 1
	if comp == 1:
		if i < 3:
			$Label.text = med_riddles[i]
			$Option1.text = medium_riddles_choices[i][0]
			$Option2.text = medium_riddles_choices[i][1]
			$Option3.text = medium_riddles_choices[i][2]
			$Option4.text = medium_riddles_choices[i][3]
			await choice
			if ans[i-1] == med_ans[i-1] and i-1 != -1 and not once:
				once = true
				score += 1
	if comp == 2:
		if i < 3:
			$Label.text = hard_riddles[i]
			$Option1.text = hard_riddles_choices[i][0]
			$Option2.text = hard_riddles_choices[i][1]
			$Option3.text = hard_riddles_choices[i][2]
			$Option4.text = hard_riddles_choices[i][3]
			await choice
			if ans[i-1] == hard_ans[i-1] and i-1 != -1 and not once:
				once = true
				score += 1
	if not oncef and i == 3:
		scores.emit(score, comp)
		oncef = true
	if i == 3:
		self.hide()
func _on_option_1_pressed():
	once = false
	if (i < 3):
		i += 1
		ans.append($Option1.text)
	choice.emit()

func _on_option_2_pressed():
	once = false
	if (i < 3):
		i += 1
		ans.append($Option2.text)
	choice.emit() # Replace with function body.
	
func _on_option_3_pressed():
	once = false
	if (i < 3):
		i += 1
		ans.append($Option3.text)
	choice.emit() # Replace with function body.


func _on_option_4_pressed():
	once = false
	if (i < 3):
		i += 1
		ans.append($Option4.text)
	choice.emit() # Replace with function body.


func _on_player_difficulty(diff, posx, posy):
	comp = diff # Replace with function body.
	position.x = posx
	position.y = posy
