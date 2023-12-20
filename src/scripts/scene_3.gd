extends CanvasLayer

var ending = "good"

func _ready():
	if GlobalVariables.naugthy_meter >= 5:
		ending = "evil"
	elif GlobalVariables.naugthy_meter <= -5:
		ending = "good"
	else:
		ending = "death"

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "act 1":
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue 3 " + ending + ".dialogue"), "act_one")

func _process(delta):
	if GlobalVariables.scene_3_act_1_ended:
		GlobalVariables.scene_3_act_1_ended = false
		$AnimatedSprite2D.play("act 2")
		await $AnimatedSprite2D.animation_finished
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue 3 " + ending + ".dialogue"), "act_two")

	if GlobalVariables.scene_3_act_2_ended:
		GlobalVariables.scene_3_act_2_ended = false
		$AnimatedSprite2D.play("act 3 " + ending)
		await $AnimatedSprite2D.animation_finished
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue 3 " + ending + ".dialogue"), "act_three")

	if GlobalVariables.scene_3_act_3_ended:
		GlobalVariables.scene_3_act_3_ended = false
		$AnimatedSprite2D.play("act 4 " + ending)
		await $AnimatedSprite2D.animation_finished
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue 3 " + ending + ".dialogue"), "act_four")

	if GlobalVariables.scene_3_act_4_ended:
		GlobalVariables.scene_3_act_4_ended = false
		$AnimatedSprite2D.play("act 5 " + ending)
		await $AnimatedSprite2D.animation_finished
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue 3 " + ending + ".dialogue"), "act_five")
