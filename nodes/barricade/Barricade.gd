extends Area2D

export var max_hp = 4

var hp = 0
var can_break = true
var can_repair = true

func _ready():
	if hp == 0:
		$Static/Shape.set_deferred("disabled", true)
	display_hp()

func hit(n=1):
	if !(can_break && hp > 0): return
	hp -= n
	hp = clamp(hp, 0, max_hp)
	can_break = false
	$BreakCooldown.start()
	display_hp()
	
	if hp == 0:
		$Static/Shape.set_deferred("disabled", true)

func repair(n=1):
	if !(can_repair && hp < max_hp): return
	hp += n
	hp = clamp(hp, 0, max_hp)
	can_repair = false
	$RepairCooldown.start()
	display_hp()
	if hp > 0:
		$Static/Shape.set_deferred("disabled", false)

func interact():
	repair()


func display_hp():
	$Label.text = String(hp)

func display_hint():
	$Hint.visible = true

func hide_hint():
	$Hint.visible = false


func _on_BreakCooldown_timeout():
	can_break = true


func _on_RepairCooldown_timeout():
	can_repair = true
