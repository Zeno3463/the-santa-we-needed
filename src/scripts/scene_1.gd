extends CanvasLayer

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "act_1":
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue_1.dialogue"), "start")
		$AnimatedSprite2D.play("act_2")
	elif $AnimatedSprite2D.animation == "act_3":
		get_tree().change_scene_to_file("res://scenes/scene_2.tscn")
		
func _process(delta):
	if $AnimatedSprite2D.animation == "act_2" and GlobalVariables.act_1_ended:
		$AnimatedSprite2D.play("act_3")
