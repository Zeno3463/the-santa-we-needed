extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade")
	await get_tree().create_timer(3).timeout
	DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue_2.dialogue"), "start")

func _process(delta):
	if GlobalVariables.start_building:
		$"hammer audio".playing = true
		GlobalVariables.start_building = false
		$AnimatedSprite2D.play("act 2")
	if GlobalVariables.act_2_ended:
		$AnimationPlayer.play_backwards("fade")
		await $AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://scenes/scene_3.tscn")

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "act 2":
		$AnimatedSprite2D.play("act 1")
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue_2.dialogue"), "acttwo")
		$"hammer audio".stop()
