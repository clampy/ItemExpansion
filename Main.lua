potentiallyIncorrectItems = {}

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, function(tooltip, ...)
	if (tooltip ~= GameTooltip) then
		do return end end
		
	local itemName, itemLink = tooltip:GetItem()
	
	-- I believe the tooltip can show before the client has retrieved item information from the server, causing a nil item link
	if (itemLink == nil) then
		do return end end
	
	local itemID = GetItemInfoFromHyperlink(itemLink)

	-- Grab the expansion ID if an expansion override has been set
	local expansionID = ExpansionOverride[itemID]	

	local wasIdOverridden = true
	if (expansionID == nil) then
		expansionID = select(15, GetItemInfo(itemLink))
		wasIdOverridden = false
	end

	-- A quick hack to find some unreliably "classic" items. I hate it. Remove when enough overrides have been added
	if (not wasIdOverridden and expansionID == 0 and itemID > 19500) then
		GameTooltip:AddLine(ExpansionStrings[expansionID] .. " (Unreliable)", 0.84, 0.72, 0.48)

		-- Store items that are potentially incorrect for easy correcting
		itemString = ", -- " .. itemName
		potentiallyIncorrectItems[itemID] = itemString
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

	-- for i=1,GameTooltip:NumLines()do print(_G["GameTooltipTextLeft"..i]:GetText())end
