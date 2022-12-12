TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, function(tooltip, ...)
	local itemName, itemLink = tooltip:GetItem()

	expansionID = ExpansionOverride[GetItemInfoFromHyperlink(itemLink)]	
	if (expansionID == nil) then
		expansionID = select(15, GetItemInfo(itemLink))
	end
	
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine(ExpansionStrings[expansionID], 0.84, 0.72, 0.48)
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