extends CanvasLayer

func cambiar_escena(target : String):
	$AnimationPlayer.play("disolver")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("disolver")
