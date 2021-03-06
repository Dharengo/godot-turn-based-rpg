extends Node2D
class_name Party

export var PARTY_SIZE : int = 3

var inventory = Inventory.new()

func get_active_members():
	"""
	Returns the first unlocked children until the party is filled
	"""
	var active = []
	var available = get_unlocked_characters()
	for i in range(min(len(available), PARTY_SIZE)):
		active.append(available[i])
	return active
	
func get_unlocked_characters() -> Array:
	"""
	Returns all the characters that can be active in the party
	"""
	var has_unlocked = []
	for member in get_children():
		if member.visible:
			has_unlocked.append(member)
	return has_unlocked

func update_members(battlers : Array):
	"""
	Updates character stats from their battlers
	after combat is complete
	"""
	for battler in battlers:
		var character_name = battler.name
		var stats = battler.stats as CharacterStats
		find_node(character_name, false).update_stats(stats)
