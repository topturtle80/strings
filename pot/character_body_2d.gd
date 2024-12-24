extends CharacterBody2D

var str_number = 6
var ammo = 15

@onready var str6 = $"../Node2D/Sprite2D"
@onready var str5 = $"../Node2D/Sprite2D2"
@onready var str4 = $"../Node2D/Sprite2D3"
@onready var str3 = $"../Node2D/Sprite2D4"
@onready var str2 = $"../Node2D/Sprite2D5"
@onready var str1 = $"../Node2D/Sprite2D6"
@onready var muzzle = $Marker2D
@onready var reload_text = $"../TextEdit"


var Bullet = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		str_number = str_number + 1
	if Input.is_action_just_pressed("ui_down"):
		str_number = str_number - 1
	
	if Input.is_action_just_pressed("ui_accept") and ammo != 0:
		shoot()
		ammo -= 1
	elif ammo == 0:
		reload()
	elif ammo > 15:
		ammo = 15

	
	
	if str_number == 6:
		position.y = str6.position.y
	elif str_number == 5:
		position.y = str5.position.y
	elif str_number == 4:
		position.y = str4.position.y
	elif str_number == 3:
		position.y = str3.position.y
	elif str_number == 2:
		position.y = str2.position.y
	elif str_number == 1:
		position.y = str1.position.y   
	
	if str_number >= 7:
		str_number = 6
	elif str_number <= 0:
		str_number = 1
	
	
	print(ammo)


	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = muzzle.global_transform
func reload():
	reload_text.visible = true
	await get_tree().create_timer(1.0).timeout
	reload_text.visible = false
	ammo = 15
