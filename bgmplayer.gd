extends AudioStreamPlayer


@export var playlist : Array[AudioStreamMP3]

func _process(delta):
	if $"../MainMenu".visible:
		change_song(0)
	elif $"../OpeningCutscene":
		change_song(3)
	elif $"../GUI".dialogue_label.visible:
		change_song(2)
	elif $"../MainCamera".is_current():
		change_song(4)
	elif $"../BattleCamera".is_current():
		change_song(1)

func change_song(SongNumber : int):
	if stream != playlist[SongNumber]:
		stream = playlist[SongNumber]
		play()
