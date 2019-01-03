extends Node2D

var player_words = [] # words that the player will type
# o %s serve para pegar os valores do array em sequência.
var prompt = ["a name", "a city", "a person", "a feeling"]
var story = "%s is the most important figure in %s. %s must really %s him, otherwise you would not be playing this game."

func _ready():
	$Blackboard/TextBox.grab_focus()
	$Blackboard/StoryText.text = "Greetings.\nThis is a new game by Momentanius.\nPlease, answer the questions in order. \nCan I have " + prompt[player_words.size()] + " please? "
	print(story % prompt)
	
	# O $ funciona como um atalho para get_node("Blackboard/StoryText")
#	$Blackboard/StoryText.bbcode_text = story % prompt;
	$Blackboard/TextBox.text = ""

func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $Blackboard/TextBox.get_text()
		_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.text = ""
	check_player_word_lenght()

func prompt_player():
	$Blackboard/StoryText.text = "Can I have " + prompt[player_words.size()] + " please? "
	

func is_story_done():
	return player_words.size() == prompt.size()

func check_player_word_lenght():
	if is_story_done():
		tell_story()
		$Blackboard/TextureButton/ButtonLabel.text = "Again"
	else:
		prompt_player()
	

# story % player_words faz ele selecionar o próximo valor em um array automaticamente.
func tell_story():
	$Blackboard/StoryText.text = story % player_words
	end_game()

func end_game():
	$Blackboard/TextBox.queue_free()
	pass
