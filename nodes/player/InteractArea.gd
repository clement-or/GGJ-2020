extends Area2D

var objs = []


func _on_InteractArea_body_exited(body):
	var i = objs.find(body)
	if i != -1:
		objs.remove(i)
		body.hide_hint()

func _on_InteractArea_body_entered(body):
	if body.is_in_group("interactable"):
		print(body)
		objs.push_back(body)
		body.display_hint()

func _input(event):
	if event.is_action_pressed("interact") && objs.size() > 0:
		objs[0].interact()


func _on_InteractArea_area_entered(area):
	_on_InteractArea_body_entered(area)


func _on_InteractArea_area_exited(area):
	_on_InteractArea_body_exited(area)
