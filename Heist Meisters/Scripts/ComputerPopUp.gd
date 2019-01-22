extends Popup

func set_text(combination):
	$RichTextLabel.bbcode_text = "Will you stop forgetting your access code, Igor? I've set it to " + PoolStringArray(combination).join("") + ". Don't forget it!"