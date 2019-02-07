extends ItemList

func update_disguises(numberofdisguises):
	clear()
	for disguises in range (numberofdisguises):
		add_icon_item(load(Global.box_sprite), false)
