extends Area2D

export var speed = 700

func _process(delta):
	position += Vector2(1, 0).rotated(rotation) * speed * delta


func _on_Bullet_body_entered(body):
	if body.get_class() == "StaticBody2D" || body.get_class() == "RigidBody2D" || body.get_class() == "Enemy":
		queue_free()


func _on_DespawnTimer_timeout():
	queue_free()
