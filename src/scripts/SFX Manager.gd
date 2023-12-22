extends AudioStreamPlayer

@export var fall_sfx: AudioStream
@export var stand_up_sfx: AudioStream
@export var timmy_walk_in_sfx: AudioStream
@export var police_break_in_sfx: AudioStream
@export var police_kills_santa_sfx: AudioStream
@export var timmy_kills_santa_sfx: AudioStream
@export var santa_gives_sfx: AudioStream
@export var timmy_walks_out_sfx: AudioStream

func _ready():
	await get_tree().create_timer(1).timeout
	stream = fall_sfx
	play()
	await get_tree().create_timer(1.9).timeout
	stream = stand_up_sfx
	play()
	
func play_timmy_walk_in():
	stream = timmy_walk_in_sfx
	play()
	
func play_police():
	stream = police_break_in_sfx
	play()
	
func play_police_kills_santa():
	stream = police_kills_santa_sfx
	play()

func play_timmy():
	stream = timmy_kills_santa_sfx
	play()
	
func play_santa_gives():
	stream = santa_gives_sfx
	play()

func play_timmy_walks_out():
	stream = timmy_walks_out_sfx
	play()
