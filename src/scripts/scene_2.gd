extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(3).timeout
	DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue_2.dialogue"), "start")

func _process(delta):
	if GlobalVariables.start_building:
		$AnimatedSprite2D.play("act 2")
		await $AnimatedSprite2D.animation_finished
		$AnimatedSprite2D.play("act 1")
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/dialogue_2.dialogue"), "acttwo")
		GlobalVariables.start_building = false
	if GlobalVariables.act_2_ended:
		get_tree().change_scene_to_file("res://scenes/scene_3.tscn")
