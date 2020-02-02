extends Control

export(NodePath) var player

func _ready():
	assert(player)
	player = get_node(player)

func _process(delta):
	$Ammo/Label.text = String(player.ammo) + " / " + String(player.max_ammo)

