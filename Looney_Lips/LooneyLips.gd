extends Node2D

func _ready():
	# o %s serve para pegar os valores do array em sequência.
	var prompt = ["Prince Lacroix", "Los Angeles", "Neonates", "killed", "Camarilla"]
	var story = "%s is the most important figure in %s. All %s must be introduced to him, otherwise they will be %s. Long live the %s"
	print(story % prompt)
	# O $ funciona como um atalho para get_node("Blackboard/StoryText")
	$Blackboard/StoryText.bbcode_text = story % prompt;
	$Blackboard/TextBox.text = ""

func _on_TextureButton_pressed():
	var new_text = $Blackboard/TextBox.get_text()
	_on_TextBox_text_entered(new_text)
	$Blackboard/TextBox.text = ""

func _on_TextBox_text_entered(new_text):
	$Blackboard/StoryText.bbcode_text = new_text;
	$Blackboard/TextBox.text = ""


