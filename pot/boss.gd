extends StaticBody2D

@onready var top_point = $"../Marker2D"
@onready var bot_point = $"../Marker2D2"

var speed = 100
var current_point = 1
var health = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if health == 0:
		queue_free()
	if current_point == 1:
		position += transform.y * speed * delta
		if position.y >= bot_point.position.y:
			current_point = 2
	if current_point == 2:
		position -= transform.y * speed * delta
		if position.y <= top_point.position.y:
			current_point = 1





func _on_area_2d_area_entered(area: Area2D) -> void:
	health -= 1
	print(health)
