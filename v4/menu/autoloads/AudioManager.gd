# This script is used to play SFX or Soundtrack.
# Using this enables uninterrupted sounds while changing scenes.

extends AudioStreamPlayer

var startup_sound
var ost
var test_sound = load("res://resources/Audio/test_sfx.wav")


func _ready():
	# The AudioManager is not affected by pausing the game. Change when needed.
	process_mode = Node.PROCESS_MODE_ALWAYS


func play_test_sfx(bus_name:String):
	self.bus = bus_name
	self.stream = test_sound
	self.play()


func play_startup_sfx():
	self.bus = "SoundEffects"
	self.stream = startup_sound
	self.play()


func play_ost():
	self.bus = "Music"
	self.stream = startup_sound
	self.play()
