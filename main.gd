extends Node

func _input(event):
	if event.is_action_pressed("escape"):
		$MainMenu.visible = true
