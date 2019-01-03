extends Node2D

func _ready():
	# o %s serve para pegar os valores do array em sequência.
	var prompt = ["Prince Lacroix", "Los Angeles", "Neonates", "killed", "Camarilla"]
	var story = "%s is the most important figure in %s. All %s must be introduced to him, otherwise they will be %s. Long live the %s"
	print(story % prompt)
	# O $ funciona como um atalho para get_node("Blackboard/StoryText")
	$Blackboard/StoryText.bbcode_text = story % prompt;
