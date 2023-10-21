extends Control

@onready var texture_rect = $TextureRect
@onready var dialogue_label = $TextureRect/MarginContainer/PanelContainer/MarginContainer/DialogueLabel

@export var opening : Array[Texture]

var count = 0
var dialogue_line
var resource = load("res://Resource/opening_cutscene.dialogue")

func _ready():
	visible = true
	add_user_signal("finished_cutscene")
	texture_rect.texture = opening[count]
	dialogue_line = await DialogueManager.get_next_dialogue_line(resource, "start")
	dialogue_label.dialogue_line = dialogue_line
	dialogue_label.type_out()

func _process(_delta):
	if Input.is_action_just_pressed("interact") and not dialogue_label.is_typing:
		if count == 4:
			emit_signal("finished_cutscene")
			visible = false
		else:
			dialogue_line = await DialogueManager.get_next_dialogue_line(resource, dialogue_line.next_id)
			dialogue_label.dialogue_line = dialogue_line
			dialogue_label.type_out()
			texture_rect.texture = opening[count]
			count += 1
