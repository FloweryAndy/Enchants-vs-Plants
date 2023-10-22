extends Node

@onready var camera_2d = $Camera2D
@onready var opening_cutscene = $OpeningCutscene

func _ready():
	opening_cutscene.connect("finished_cutscene", _on_finished_cutscene)

func _input(event):
	if event.is_action_pressed("escape"):
		$MainMenu.visible = true
		process_mode = Node.PROCESS_MODE_DISABLED
		camera_2d.zoom = Vector2(.25,.25)
		zoom_in()

func zoom_in():
	var tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(1,1), 1.0)

func zoom_out():
	var tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(.25,.25), 1.0)

func _on_finished_cutscene():
	zoom_in()
