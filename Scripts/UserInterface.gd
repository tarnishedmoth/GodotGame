extends Control

func _ready() -> void:
	Linker.UI = self

func on_win():
	$ScoreLabel.on_win()
