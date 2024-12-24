extends AudioStreamPlayer

@export  var stream1 = AudioStreamMP3
@export  var stream2 = AudioStreamMP3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stream = stream1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(stream)
	play()
