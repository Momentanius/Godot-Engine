extends Node

func generate_combination(lenght):
	var combination = []
	for number in range(lenght):
		randomize()
		combination.append(randi() % 10) #Número aleatório até 10
	return combination