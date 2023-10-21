extends AudioStreamPlayer


@export var playlist : Array[AudioStream]

func _process(delta):
	if $"../MainMenu".is_visible():
		change_song(0)
	elif $"../OpeningCutscene".is_visible():
		change_song(3)
	elif $"../MainLevel/MainGUI".dialogue_box.is_visible():
		change_song(2)
	elif $"../MainLevel".is_visible():
		change_song(4)
	elif $"../BattleLevel".is_visible():
		change_song(1)

func change_song(SongNumber : int):
	if stream != playlist[SongNumber]:
		stream = playlist[SongNumber]
		play()
