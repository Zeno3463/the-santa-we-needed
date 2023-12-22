extends CanvasLayer

var ending = "good"

func _ready():
	$AnimationPlayer.play("fade")
	if GlobalVariables.naugthy_meter >= 1:
		ending = "evil"
	elif GlobalVariables.naugthy_meter <= -5:
		ending = "good"
	else:
		ending = "death"

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "act 1":
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue 3 " + ending + ".dialogue"), "act_one")

func _process(delta):
	if GlobalVariables.story_ended:
		$AnimationPlayer.play_backwards("fade")
		await $AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://scenes/end_scene.tscn")

	if GlobalVariables.scene_3_act_1_ended:
		$"SFX Manager".play_timmy_walk_in()
		GlobalVariables.scene_3_act_1_ended = false
		$AnimatedSprite2D.play("act 2")
		await $AnimatedSprite2D.animation_finished
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue 3 " + ending + ".dialogue"), "act_two")

	if GlobalVariables.scene_3_act_2_ended:
		GlobalVariables.scene_3_act_2_ended = false
		if ending == "death": $"SFX Manager".play_police()
		if ending == "evil": $"SFX Manager".play_timmy()
		if ending == "good": $"SFX Manager".play_santa_gives()
		$AnimatedSprite2D.play("act 3 " + ending)
		await $AnimatedSprite2D.animation_finished
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue 3 " + ending + ".dialogue"), "act_three")

	if GlobalVariables.scene_3_act_3_ended:
		GlobalVariables.scene_3_act_3_ended = false
		if ending == "death": $"SFX Manager".play_police_kills_santa()
		if ending == "good": $"SFX Manager".play_timmy_walks_out()
		$AnimatedSprite2D.play("act 4 " + ending)
		await $AnimatedSprite2D.animation_finished
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue 3 " + ending + ".dialogue"), "act_four")

	if GlobalVariables.scene_3_act_4_ended:
		GlobalVariables.scene_3_act_4_ended = false
		$"SFX Manager".play_timmy_walk_in()
		$AnimatedSprite2D.play("act 5 " + ending)
		await $AnimatedSprite2D.animation_finished
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue 3 " + ending + ".dialogue"), "act_five")
