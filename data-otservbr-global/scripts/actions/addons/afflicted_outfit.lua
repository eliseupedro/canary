local afflictedOutfit = Action()

function afflictedOutfit.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local hasOutfit = player:getStorageValue(Storage.OutfitQuest.Afflicted.Outfit) == 1
	-- Plgue Mask
	if item.itemid == 12786 then
		if not hasOutfit then
			return false
		end

		if player:getStorageValue(Storage.OutfitQuest.Afflicted.AddonPlagueMask) == 1 then
			return false
		end

		player:addOutfitAddon(430, 2)
		player:addOutfitAddon(431, 2)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:setStorageValue(Storage.OutfitQuest.Afflicted.AddonPlagueMask, 1)
		player:say("You gained a plague mask for your outfit.", TALKTYPE_MONSTER_SAY, false, player)
		item:remove()

		-- Plague Bell
	elseif item.itemid == 12787 then
		if not hasOutfit then
			return false
		end

		if player:getStorageValue(Storage.OutfitQuest.Afflicted.AddonPlagueBell) == 1 then
			return false
		end

		player:addOutfitAddon(430, 1)
		player:addOutfitAddon(431, 1)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:setStorageValue(Storage.OutfitQuest.Afflicted.AddonPlagueBell, 1)
		player:say("You gained a plague bell for your outfit.", TALKTYPE_MONSTER_SAY, false, player)
		item:remove()

		-- Outfit
	else
		if hasOutfit then
			return false
		end

		for id = 12551, 12556 do
			if player:getItemCount(id) < 1 then
				return false
			end
		end

		for id = 12551, 12556 do
			player:removeItem(id, 1)
		end

		player:addOutfit(430)
		player:addOutfit(431)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:setStorageValue(Storage.OutfitQuest.Afflicted.Outfit, 1)
		player:say("You have restored an outfit.", TALKTYPE_MONSTER_SAY, false, player)
	end
	return true
end

afflictedOutfit:id(12551, 12552, 12553, 12554, 12555, 12556, 12786, 12787)
afflictedOutfit:register()
