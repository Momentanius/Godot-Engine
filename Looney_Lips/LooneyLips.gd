extends Node2D

var player_words = [] # words that the player will type
#Isso se chama dictionary. Eles são criados com { e são semelhantes a JSONs. 
var template = [{
		"prompt":["a name", "a city", "a person", "a feeling"],
		"story": "%s is the most important figure in %s. %s must really %s him, otherwise you would not be playing this game."
		},
		{
		"prompt":["the first part of the meme", "the second part of the meme", "the third part of the meme"],
		"story": "What is a %s? A miserable little pile of %s. But enough talk, %s."
		},
		{
		"prompt":["a fruit", "a taste", "another fruit"],
		"story": "Do you like %s? I think they are pretty %s, but not as good as %s."
		},
		{
		"prompt":["a game", "another gamet"],
		"story": "I really like %s, but %s is a better game."
		}
		
		]
var current_story

func _ready():
	randomize()
	current_story = template[randi() % template.size()]
	
	$Blackboard/TextBox.grab_focus()
	$Blackboard/StoryText.text = "Greetings.\nThis is a new game by Momentanius.\nPlease, answer the questions in order. \nCan I have " + current_story.prompt[player_words.size()] + " please? "
	
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
	$Blackboard/StoryText.text = "Can I have " + current_story.prompt[player_words.size()] + " please? "
	

func is_story_done():
	return player_words.size() == current_story.prompt.size()

func check_player_word_lenght():
	if is_story_done():
		tell_story()
		$Blackboard/TextureButton/ButtonLabel.text = "Again"
	else:
		prompt_player()
	

# story % player_words faz ele selecionar o próximo valor em um array automaticamente.
func tell_story():
	$Blackboard/StoryText.text = current_story.story % player_words
	end_game()

#Queue Free remove um nó da cena. Excelente para remover elementos quanto eles estiverem prontos.
func end_game():
	$Blackboard/TextBox.queue_free()
	pass
