extends Popup

func set_text(combination):
	$NinePatchRect/CenterContainer/NinePatchRect/Label.text = (
		"Stop forgetting your access code, it has gotten to be ridiculous!! I've set it to "
		+ PoolStringArray(combination).join("") +
		", but this is the last time!"	)
