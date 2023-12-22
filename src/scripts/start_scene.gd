extends CanvasLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("start"):
		$AnimationPlayer.play("fade")
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/scene_1.tscn")

func _on_video_stream_player_finished():
	$AnimationPlayer.play_backwards("fade")
	$VideoStreamPlayer.queue_free()
