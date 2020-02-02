extends KinematicBody2D

onready var Bullet = preload("res://nodes/bullet/Bullet.tscn")

export var speed = 200
export var max_ammo = 20

var ammo = max_ammo
var vel = Vector2()

func _ready(): 
	pass

func _physics_process(delta):
	vel.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	vel.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	
	vel = vel.normalized() * speed
	look_at(get_global_mouse_position())
	
	move_and_slide(vel, Vector2.UP)

func _input(event):
	if event.is_action_pressed("fire"):
		shoot()

func shoot():
	if ammo <= 0: return
	
	var i = Bullet.instance()
	i.global_position = $BulletSpawn.global_position
	i.rotation = rotation
	get_parent().add_child(i)
	
	ammo -= 1

func get_class(): return "Player"


