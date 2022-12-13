TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, function(tooltip, ...)
	local itemName, itemLink = tooltip:GetItem()
	local itemID = GetItemInfoFromHyperlink(itemLink)	
	local expansionID = ExpansionOverride[itemID]	

	local WasIdOverridden = true
	if (expansionID == nil) then
		expansionID = select(15, GetItemInfo(itemLink))
		WasIdOverridden = false
	end

	-- A quick hack to find some unreliably "classic" items. I hate it
	if (not WasIdOverridden and expansionID == 0 and itemID > 20000) then
		GameTooltip:AddLine(ExpansionStrings[expansionID] .. " (Unreliable)", 0.84, 0.72, 0.48)
	else
		GameTooltip:AddLine(ExpansionStrings[expansionID], 0.84, 0.72, 0.48)
	end
end)

-- Convert expansionID into a string
ExpansionStrings = {
    [0] = "Classic",
	[1] = "Burning Crusade",
	[2] = "Wrath of the Lich King",
	[3] = "Cataclysm",
	[4] = "Mists of Pandaria",
	[5] = "Warlords of Draenor",
	[6] = "Legion",
	[7] = "Battle for Azeroth",
	[8] = "Shadowlands",
	[9] = "Dragonflight"
}