extends Control


onready var levelText : Label = get_node("Background/LevelBackground/LevelText")
onready var healthBar : TextureProgress = get_node("Background/HealthBar")
onready var xpBar : TextureProgress = get_node("Background/XpBar")
onready var goldText : Label = get_node("Background/GoldText")


func update_level_text (level):
	levelText.text = str(level)


func update_health_bar (curHp, maxHp):
	healthBar.value = (100 / maxHp) * curHp


func update_xp_bar (curXp, xpToNextLevel):
	xpBar.value = (100 / xpToNextLevel) * curXp


func update_gold_text (gold):
	goldText.text = "Gold: " + str(gold)
