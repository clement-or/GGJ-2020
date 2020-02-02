extends Area2D

onready var t = $RefuelCooldown

var players = []

func _on_EggBox_body_entered(body):
	if body.get_class() == "Player":
		if players.size() == 0: t.start()
		players.push_back(body)
		

func _on_RefuelCooldown_timeout():
	for p in players:
		refuel(p)

func refuel(player):
	if player.ammo < player.max_ammo:
		$Anim.play("hint")
		player.ammo += 3
		player.ammo = clamp(player.ammo, 0, player.max_ammo)


func _on_EggBox_body_exited(body):
	if body.get_class() == "Player":
		var i = players.find(body)
		if i != -1 : 
			players.remove(i)
		if players.size() <= 0:
			yield($Anim, "animation_finished")
			$Anim.stop()
