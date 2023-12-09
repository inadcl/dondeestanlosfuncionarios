extends Node

var level:int = 0
var vader:bool = false
var cafe:bool = false
var premio:bool = false

func changeLevel(value):
	level = value
	print(level)

func vaderEncontrado():
	vader = true
func cafeEncontrado():
	cafe = true
func premioEncontrado():
	premio = true
	
func isNarrador():
	return cafe || premio || vader;
