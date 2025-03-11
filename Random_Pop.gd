extends Sprite2D

signal popChoice

var questions = [
	"Society expects you to conform to a certain norm, but it makes you uncomfortable. Do you:",
	"Society praises a particular lifestyle that you don’t believe in. Do you:",
	"You’re at a public event where everyone is gossiping about someone you care about. Do you:",
	"You have the chance to achieve significant success, but it involves doing something that society would frown upon. Do you:",
	"Society expects you to celebrate a holiday or event you don’t agree with. Do you:",
	"You’re offered an opportunity that could boost your reputation, but it involves endorsing something you don’t believe in. Do you:",
	"Society holds a particular standard of beauty or success that you don’t agree with. Do you:",
	"You have the chance to speak out against an injustice, but doing so could make you unpopular. Do you:",
	"You’re asked to compromise your values to gain acceptance in a community. Do you:",
	"You want to follow a career path that isn’t socially prestigious. Do you:"
]
var options = [
	["Follow society", "Stay true"],
	["Adopt lifestyle", "Reject it"],
	["Join in", "Stay silent"], 
	["Go for it", "Turn it down"],
	["Participate", "Skip it"],
	["Accept it", "Decline it"],
	["Change yourself", "Embrace self"],
	["Voice opinion", "Stay silent"],
	["Sacrifice values", "Maintain integrity"],
	["Pursue career", "Follow path"]
]
var random_ans = ["Follow society", "Adopt lifestyle", "Join in", "Go for it", "Participate", "Accept it", "Change yourself", "Voice opinion", "Sacrifice values", "Pursue career" ]
var ans = []
var i = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if i < 10:
		$Label.text = questions[i]
		$Option1.text = options[i][0]
		$Option2.text = options[i][1]
		await popChoice 
	if i == 10:
		self.hide()


func _on_option_1_pressed():
	i += 1 # Replace with function body.
	popChoice.emit()

func _on_option_2_pressed():
	i += 1 # Replace with function body.
	popChoice.emit()


func _on_player_randomness(posx, posy):
	position.x = posx
	position.y = posy # Replace with function body.
