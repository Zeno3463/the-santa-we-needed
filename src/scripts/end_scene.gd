extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	var ending = ""
	var ending_no = ""
	if GlobalVariables.naugthy_meter >= 1:
		ending = "Evil"
		ending_no = "3"
	elif GlobalVariables.naugthy_meter <= -5:
		ending = "Good"
		ending_no = "1"
	else:
		ending = "Death"
		ending_no = "2"
	$Control/Label.text = "You Got The " + ending + " Ending" + "(" + ending_no + "/3)"
